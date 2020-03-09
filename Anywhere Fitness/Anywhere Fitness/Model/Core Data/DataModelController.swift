//
//  DataModelController.swift
//  Anywhere Fitness
//
//  Created by Alex Shillingford on 3/8/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation
import CoreData

class DataModelController {
//
//typealias CompletionHandler = (Error?) -> Void
//
//init() {
//    fetchTasksFromServer()
//}
//
//    let baseURL = URL(string: "https://anywhere-fitness-1.firebaseio.com/")!
//    
//    
//    private func saveToPersistentStore() {
//        let moc = CoreDataStack.shared.mainContext
//        do {
//            try moc.save()
//        } catch {
//            moc.reset()
//            print("Error saving to persistent store: \(error)")
//        }
//    }
//    
//    private func loadFromPersistentStore() -> [LSIExerciseClass] {
//        let fetchRequest: NSFetchRequest<LSIExerciseClass> = LSIExerciseClass.fetchRequest()
//        let moc = CoreDataStack.shared.mainContext
//        do {
//           return try moc.fetch(fetchRequest)
//        } catch {
//            print("Error fetching: \(error)")
//        }
//        return []
//    }
//    
//    
//func fetchExerciseClassFromServer(completion: @escaping CompletionHandler = { _
//    in }) {
//    let requestURL = baseURL.appendingPathExtension("json")
//    URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
//        guard error == nil else {
//            print("Error fetching tasks: \(error!)")
//            DispatchQueue.main.async {
//                completion(error)
//            }
//            return
//        }
//        guard let data = data else {
//            print("No data returned by data task.")
//            DispatchQueue.main.async {
//                completion(NSError())
//            }
//            return
//        }
//        do {
//            let taskRepresentations = Array(try JSONDecoder().decode([String : TaskRepresentation].self, from: data).values)
//            try self.updateTasks(with: taskRepresentations)
//            DispatchQueue.main.async {
//                completion(nil)
//            }
//        } catch {
//            print("Error decoding task represnetations: \(error)")
//            DispatchQueue.main.async {
//                completion(error)
//            }
//        }
//        }.resume()
//    }
//    
//    
//    func sendExerciseClassToServer(exerciseClass: ExerciseClass, completion: @escaping CompletionHandler = { _ in }) {
//        let uuid = exerciseClass.identifier ?? UUID()
//        let requestURL = baseURL.appendingPathComponent(uuid.uuidString).appendingPathExtension("json")
//        var request = URLRequest(url: requestURL)
//        request.httpMethod = "PUT"
//        do {
//            guard var representation = exerciseClass.exerciseClassRepresentation else {
//                completion(NSError())
//                return
//            }
//            representation.identifier = uuid.uuidString
//            exerciseClass.identifier = uuid
//            try CoreDataStack.shared.save(context: CoreDataStack.shared.mainContext)
//            request.httpBody = try JSONEncoder().encode(representation)
//        } catch {
//            print("Error encoding task \(exerciseClass): \(error)")
//            completion(error)
//            return
//        }
//        URLSession.shared.dataTask(with: request) { (data, _, error) in
//            guard error == nil else {
//                print("Error PUTting task to server: \(error!)")
//                DispatchQueue.main.async {
//                    completion(error)
//                }
//                return
//            }
//            DispatchQueue.main.async {
//                completion(nil)
//            }
//        }.resume()
//    }
//    
//    
//    func deleteExerciseClassFromServer(_ exerciseClass: ExerciseClass, completion: @escaping CompletionHandler = { _ in }) {
//        guard let uuid = exerciseClass.identifier else {
//            completion(NSError())
//            return
//        }
//        let requestURL = baseURL.appendingPathComponent(uuid.uuidString).appendingPathExtension("json")
//        var request = URLRequest(url: requestURL)
//        request.httpMethod = "DELETE"
//        
//        URLSession.shared.dataTask(with: request) { (_, _, error) in
//            guard error == nil else {
//                print("Error deleting task: \(error!)")
//                DispatchQueue.main.async {
//                    completion(error)
//                }
//                return
//            }
//            DispatchQueue.main.async {
//                completion(nil)
//            }
//        }.resume()
//    }
//    
//
//    private func update(exerciseClass: ExerciseClass, with representation: ExerciseClassRepresentation) {
//        exerciseClass.name = representation.name
//        exerciseClass.type  = representation.type
//        exerciseClass.intensityLevel = representation.intensityLevel
//        exerciseClass.startTime = representation.startTime
//        exerciseClass.attendees = representation.attendees
//        exerciseClass.maxClassSize = representation.maxClassSize
//    }
//    
//    private func put(exerciseClass: ExerciseClass, completion: @escaping CompletionHandler = { _ in}) {
//           let uuid = entry.identifier ?? UUID()
//           let requestURL = baseURL.appendingPathExtension("json")
//           var request = URLRequest(url: requestURL)
//           request.httpMethod = "PUT"
//           do {
//               guard var representation = exerciseClass.exerciseClassRepresentation else {
//                   completion(NSError())
//                   return
//               }
//               representation.identifier = uuid.uuidString
//               entry.identifier = uuid
//               try saveToPersistentStore()
//               request.httpBody = try JSONEncoder().encode(representation)
//               } catch {
//                   print("Error encoding entry \(entry): \(error)")
//                   completion(error)
//                   return
//           }
//          URLSession.shared.dataTask(with: request) { (data, _, error) in
//               guard error == nil else {
//                   print("Error PUTting task to server: \(error!)")
//                   DispatchQueue.main.async {
//                       completion(error)
//                   }
//                   return
//               }
//               DispatchQueue.main.async {
//                   completion(nil)
//               }
//           }.resume()
//        
//    // MARK: - CRUD Methods
//    
//    func createCRUD(name: String, type: String, intensityLevel: String, attendees: Int, maxClassSize: Int, id: String) {
//        put(exerciseClass: ExerciseClass())
//        saveToPersistentStore()
//    }
//    
//    func updateCRUD(for entry: Entry, update title: String, update bodyText: String, update mood: String) {
//        guard let exerciseClassList = exerciseClass!.firstIndex(of: exerciseClass) else { return }
//        put(exerciseClass: ExerciseClass())
//        saveToPersistentStore()
//    }
//    
//    
//    func deleteCRUD(for entry: Entry) {
//        guard let exerciseClassList = exerciseClass?.firstIndex(of: exerciseClass) else { return }
//        let moc = CoreDataStack.shared.mainContext
//        moc.delete((exerciseClass?[exerciseClassList])!)
//        deleteEntryFromServer(exerciseClass)
//        saveToPersistentStore()
//        }
//    }
}
