//
//  ViewController.swift
//  JsonParsingSwift4
//
//  Created by Pro Retina on 18/12/17.
//  Copyright © 2017 Pro Retina. All rights reserved.
//

import UIKit

struct WebsiteDescription:Decodable {
    let name:String
    let description:String
    let courses:[Course]
}

struct Course:Decodable {
    let id:Int?
    let name:String?            // make optional ? if field is comming null
    let link:String?
    let imageUrl:String?
//
//    init(json:[String:Any]){
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageURL = json["imageUrl"] as? String ?? ""
//    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses" or course
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields" //missing field
        guard let url = URL(string: jsonUrlString) else{ return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // perhapse check err
            // also perhapse chek response status 200 ok
            
            guard let data = data else{ return}
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            
            do {
                
                
                
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                print(websiteDescription.name, websiteDescription.description)
                
                let courses = try JSONDecoder().decode([Course].self, from: data) // add only []
//                print(courses)
                print(courses[0].name!)
                
                // Swift 2/3/ObjC
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else{ return }
//                let course = Course(json:json)
//                print(course.imageURL)
            }catch let jsonErr {
                print("Error serializing json: ",jsonErr)
            }
            
        }.resume()
        
//        let mycourse = Course(id:1,name:"my course", link: "some link", imageURL: "some image url")
//        print(mycourse)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

