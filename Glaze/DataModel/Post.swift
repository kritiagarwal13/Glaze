//
//  Post.swift
//  Glaze
//
//  Created by Kriti Agarwal on 24/04/24.
//

import Foundation

struct Post: Identifiable {
    var id: Int
    var image: String
    var username: String
}

// sample data array
var posts: [Post] = [
    Post(id: 1, image: "post1", username: "maggie"),
    Post(id: 2, image: "post2", username: "pearl"),
    Post(id: 3, image: "post3", username: "savannah"),
    Post(id: 4, image: "post4", username: "glaze"),
    Post(id: 5, image: "post5", username: "emily"),
    Post(id: 6, image: "post6", username: "maxine"),
    Post(id: 7, image: "post7", username: "maggie"),
    Post(id: 8, image: "post8", username: "pearl"),
    Post(id: 9, image: "post9", username: "savannah"),
    Post(id: 10, image: "post10", username: "glaze"),
    Post(id: 11, image: "post11", username: "emily"),
    Post(id: 12, image: "post12", username: "maxine"),
    Post(id: 13, image: "post13", username: "maggie"),
    Post(id: 14, image: "post14", username: "pearl"),
    Post(id: 15, image: "post15", username: "savannah"),
    Post(id: 16, image: "post16", username: "glaze"),
    Post(id: 17, image: "post17", username: "emily"),
    Post(id: 18, image: "post18", username: "maxine"),
    Post(id: 19, image: "post19", username: "maggie"),
    Post(id: 20, image: "post20", username: "pearl")
]
