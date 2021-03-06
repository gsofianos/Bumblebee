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

public class PLSDecoder {

	public static Gee.ArrayList<string>? parse (string url) {

        string data = get_file (url);

    	if (data == null) {
    		stderr.printf ("Failed to download file\n");
    		return null;
    	}

    	var url_list = new Gee.ArrayList<string> ();
    	string[] lines = data.split ("\n");

    	foreach (unowned string line in lines) {
          if (line.index_of ("File") == 0) {
          	string[] strs = line.split ("=",2);
          	url_list.add (strs[1]);
          }
        }

        if (url_list.size == 0)
        	return null;
        return url_list;
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
