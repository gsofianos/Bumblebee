/*-
 *  Copyright (c) 2019 George Sofianos
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  Authored by: George Sofianos <george.sofianos@outlook.com>
 *  
 */

 public class Bumblebee.Models.Station {

    public int    id {get;set;}
    public string name {get;set;}
    public string url {get;set;}
    public Gee.ArrayList<string> genres {get;set;}
    public bool favorite {get;set;}

    public Station (int id, string name, string url, Gee.ArrayList<string>? genres=null, bool favorite=false) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.genres = genres;
        this.favorite = favorite;
    }
}
