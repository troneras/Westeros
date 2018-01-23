//
//  Repository.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import Foundation

final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    
    typealias Filter = (House) -> Bool
    
    var houses: [House] { get }
    func house(named: String) -> House?
    func houses(filteredBy: Filter) -> [House]
}

final class LocalFactory: HouseFactory {
    func houses(filteredBy: Filter) -> [House] {
        return Repository.local.houses.filter(filteredBy)
    }
    
    var houses: [House] {
        let houses = remoteHouses()
        return houses.sorted()
        // Houses creation here
//        let starkSigil = Sigil(imageName: "codeIsComing.png", description: "Lobo Huargo")
//        let lannisterSigil = Sigil(imageName: "lannister.jpg", description: "León Rampante")
//        let targaryenSigil = Sigil(imageName: "targaryenSmall.jpg", description: "Dragón tricéfalo")
//
//        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
//        let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
//        let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
//
//        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno!", url: starkURL)
//        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido!", url: lannisterURL)
//        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: targaryenURL)
//
//        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
//        let arya = Person(name: "Arya", house: starkHouse)
//        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
//        let cersei = Person(name: "Cersei", house: lannisterHouse)
//        let jaime = Person(name: "Jaime", alias: "El matarreyes", house: lannisterHouse)
//        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
//
//        // Add characters to houses
//        starkHouse.add(persons: arya, robb)
//        lannisterHouse.add(persons: tyrion, cersei, jaime)
//        targaryenHouse.add(person: dani)
//
//        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
        
    }
    
    func house(named: String) -> House? {
        let house = houses.filter { $0.name.uppercased() == named.uppercased() }.first
        return house
    }
    
    
}

private extension LocalFactory {
    func houses(fromResource resource: String, withExension ext: String) -> [House] {
        let bundle = Bundle(for: type(of: self))
        if let file = bundle.url(forResource: resource, withExtension: ext) {
            do {
                let data = try Data(contentsOf: file)
                let jsonDecoder = JSONDecoder()
                let houses = try! jsonDecoder.decode([House].self, from: data)
                
                return houses
            } catch {
                return []
            }
        }
        return []
    }
    
    func remoteHouses() -> [House] {
        func house(named name: String, in collection: [House]) -> House {
            return collection.first{ $0.name == name }!
        }
        
        let characters = persons(fromResource: "characters", withExtension: "json")
        var houses = Set<House>()
        characters.forEach { houses.insert($0.house) }
        characters.forEach{
            let h = house(named: $0.house.name, in: Array(houses))
            h.add(person: $0)
        }
        
        return Array(houses)
    }
    func persons(fromResource resource: String, withExtension ext: String) -> [Person]  {
        let bundle = Bundle(for: type(of: self))
        if let file = bundle.url(forResource: resource, withExtension: ext) {
            do {
                let data = try Data(contentsOf: file)
                let jsonDecoder = JSONDecoder()
                let persons = try! jsonDecoder.decode([Person].self, from: data)
                
                return persons
            } catch {
                return []
            }
        }
        return []
    }
}
