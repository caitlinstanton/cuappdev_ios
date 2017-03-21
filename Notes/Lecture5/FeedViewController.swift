//
//  FeedViewController.swift
//  Lecture5
//
//  Created by Caitlin Stanton on 3/20/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class Post {
    
    var creator: String
    var songName: String
    var image: UIImage
    var isLiked: Bool
    
    init(creator: String, songName: String, image: UIImage, isLiked: Bool) {
        self.creator = creator
        self.songName = songName
        self.image = image
        self.isLiked = isLiked
    }
    
}

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FeedTableViewCellDelegate {

    var tableView: UITableView!
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        tableView = UITableView(frame: view.frame)
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "Reuse")
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        fetchPosts()
    }
    
    func fetchPosts() {
        
        let post1 = Post(creator: "Adam", songName: "Hello", image: #imageLiteral(resourceName: "adam"), isLiked: false)
        let post2 = Post(creator: "Dennis", songName: "Starboy", image: #imageLiteral(resourceName: "dennis"), isLiked: false)
        let post3 = Post(creator: "Dan", songName: "Closer", image: #imageLiteral(resourceName: "dan"), isLiked: false)
        let post4 = Post(creator: "Andrew", songName: "Let Me Love You", image: #imageLiteral(resourceName: "andrew"), isLiked: false)
        
        posts = [post1, post2, post3, post4]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse") as? FeedTableViewCell {
            let post = posts[indexPath.row]
            cell.setupCellWithPost(profileImage: post.image, creatorName: post.creator, songName: post.songName, isLiked: post.isLiked)
            return cell
        }
        return UITableViewCell()
    }
    
    func feedTableViewCellDidTapHeartButton(feedTableViewCell: FeedTableViewCell) {
        print("here")
    }
}
