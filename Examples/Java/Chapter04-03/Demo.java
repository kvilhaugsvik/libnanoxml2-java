/* Demo.java                                                       NanoXML/Java
 *
 * $Revision: 1.1.1.1 $
 * $Date: 2001/07/16 22:24:40 $
 * $Name:  $
 *
 * This file is part of NanoXML 2 for Java.
 * Copyright (C) 2001 Marc De Scheemaecker, All Rights Reserved.
 *
 * This software is provided 'as-is', without any express or implied warranty.
 * In no event will the authors be held liable for any damages arising from the
 * use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 *  1. The origin of this software must not be misrepresented; you must not
 *     claim that you wrote the original software. If you use this software in
 *     a product, an acknowledgment in the product documentation would be
 *     appreciated but is not required.
 *
 *  2. Altered source versions must be plainly marked as such, and must not be
 *     misrepresented as being the original software.
 *
 *  3. This notice may not be removed or altered from any source distribution.
 */

import net.n3.nanoxml.*;
import java.io.*;

public class Demo
{

    public static void main(String[] args)
        throws Exception
    {
        IXMLParser parser = XMLParserFactory.createDefaultXMLParser();
        IXMLValidator validator = parser.getValidator();
        validator.setParameterEntityResolver(new MyResolver());
        IXMLReader reader = StdXMLReader.fileReader("test.xml");
        parser.setReader(reader);
        XMLElement xml = (XMLElement) parser.parse();
        XMLWriter writer = new XMLWriter(System.out);
        writer.write(xml);
    }

}

