/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import domain.Album;

/**
 *
 * @author isma94
 */
public interface AlbumDAO {
    
    public Album createAlbum(String title, String author, int year, String genre, String label);
            
    public boolean albumExists(String title, String author, int year);
    
}
