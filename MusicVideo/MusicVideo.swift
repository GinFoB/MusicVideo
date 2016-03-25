//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Akram khalifa on 24/03/2016.
//  Copyright © 2016 Akram khalifa. All rights reserved.
//

import Foundation

class Videos {
    
    // Data Encapsulation
    
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    //optioanl for instanse
    private var _vRights:String
    private var _vPrice:String
    private var _vArtist:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToiTuens:String
    private var _vReleaseDte:String
    
    // form UI
    
    var vImageData:NSData?
    
    // getter
    
    var vName: String{
        return _vName
    }
    
    var vImageUrl: String{
        return _vImageUrl
    }
    
    var vVideoUrl: String{
        return _vVideoUrl
    }
    
    // for optianl instanse
    
    var vRights: String{
        return _vRights
    }
    var vPrice: String{
        return _vPrice
    }
    var vArtist: String{
        return _vArtist
    }
    var vImid: String{
        return _vImid
    }
    var vGenre: String{
        return _vGenre
    }
    var vLinkToiTuens: String{
        return _vLinkToiTuens
    }
    var vReleaseDte: String{
        return _vReleaseDte
    }
    
    init(data: JSONDictionary){
        
        // video name
        if let name = data["im:name"] as? JSONDictionary,
        vName = name["label"] as? String {
            self._vName = vName
        }
        else{
            _vName = ""
        }
        
        // video image 
        if let img = data["im:image"] as? JSONArray,
        image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
                _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100",withString:"600x600")
                
        }
        else{
            _vImageUrl = ""
        }
        
        // video url
        
        if let video = data["link"] as? JSONArray,
        vUrl = video[1] as? JSONDictionary,
        vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String{
                self._vVideoUrl = vVideoUrl
        }
        else{
            _vVideoUrl = ""
        }
        
        // optianl
        
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String {
                self._vRights = vRights
        }
        else{
            _vRights = ""
        }
        
        if let price = data["im:price"] as? JSONDictionary,
            vPrice = price["label"] as? String {
                self._vPrice = vPrice
        }
        else{
            _vPrice = ""
        }
        
        if let artist = data["im:artist"] as? JSONDictionary,
            vArtist = artist["label"] as? String{
                 self._vArtist = vArtist
        }
        else{
            _vArtist = ""
        }
        
        if let imad = data["id"] as? JSONDictionary,
            att = imad["attributes"] as?JSONDictionary,
            vImid = att["im:id"] as? String{
                self._vImid = vImid
        }
        else{
            _vImid = ""
        }
        
        if let genre = data["category"] as? JSONDictionary,
            xgenre = genre["attributes"] as? JSONDictionary,
            vGenre = xgenre["term"] as? String{
                self._vGenre = vGenre
        }
        else{
            _vGenre = ""
        }
        
        if let link = data["id"] as? JSONDictionary,
            vLinkToiTuens = link["label"] as? String{
                self._vLinkToiTuens = vLinkToiTuens
        }
        else{
            _vLinkToiTuens = ""
        }
        
        if let dataRs = data["im:releaseDate"] as? JSONDictionary,
         dataPaser = dataRs["attributes"] as? JSONDictionary,
            vReleaseDte = dataPaser["label"] as? String{
                self._vReleaseDte = vReleaseDte
        }
        else{
            _vReleaseDte =  ""
        }
        
    }
        
    
}