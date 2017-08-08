//
//  LibraryAPI.swift
//  RWBlueLibrary
//
//  Created by Rohan Bhale on 08/08/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import Foundation

final class LibraryApi {
  //1
  static let shared = LibraryApi()
  
  private let persistencyManager = PersistencyManager()
  private let httpClient = HTTPClient()
  private let isOnline = false
  
  //2
  private init() {
    
  }
  
  func getAlbums() -> [Album] {
    return persistencyManager.getAlbums()
  }
  
  func addAlbum(_ album: Album, at index: Int) {
    persistencyManager.addAlbum(album, at: index)
    if isOnline {
      httpClient.postRequest("/api/addAlbum", body: album.description)
    }
  }
  
  func deleteAblum(at index: Int) {
    persistencyManager.deleteAlbum(at: index)
    if isOnline {
      httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
    }
  }
}
