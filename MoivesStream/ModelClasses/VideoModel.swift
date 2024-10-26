//
//  VideoModel.swift
//  MoivesStream
//
//  Created by Mani Sankar on 26/10/24.
//


struct VideoModel: Codable {
    let id: String
    let title: String
    let thumbnailUrl: String
    let duration: String
    let uploadTime: String
    let views: String
    let author: String
    let videoUrl: String
    let description: String
    let subscriber: String
    let isLive: Bool
}
