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

public class M3UDecoder {

    public static Gee.ArrayList<string>? parse (string url) {

       string data = get_file (url);

       if (data == null){
          stderr.printf ("Failed to download m3u file\n");
          return null;
       }

       var myList = new Gee.ArrayList<string> ();
       string[] lines = data.split ("\n");
       int comment;

       foreach (unowned string line in lines) {
          if (line != "") {
            comment = line.index_of ("#");
            if (line.contains ("://") && comment == -1)
              myList.add(line);
          }
       }

        if (myList.size == 0)
            return null;

        return myList;
    }

    private static string? get_file (string url) {

      var session = new Soup.Session();
      var msg = new Soup.Message ("GET", url);
      session.send_message (msg);

      var data = (string) msg.response_body.data;

      if (msg.status_code == 200)
        return data;
      else
        return null;
    }

}
