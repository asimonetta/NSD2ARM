/*
    Structorizer
    A little tool which you can use to create Nassi-Shneiderman Diagrams (NSD)

    Copyright (C) 2009  Bob Fisch

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or any
    later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package lu.fisch.structorizer.parsers;

/******************************************************************************************************
 *
 *      Author:         Kay Gürtzig
 *
 *      Description:    Importer for NSD files generated by hus-Struktogrammer.
 *
 ******************************************************************************************************
 *
 *      Revision List
 *
 *      Author          Date            Description
 *      ------          ----            -----------
 *      Kay Gürtzig     2019-09-13      First Issue (for #746)
 *
 ******************************************************************************************************
 *
 *      Comment:
 *      2019-09-13 / Kay Gürtzig
 *      - Initial version does not support str files as generated by the Delphi-implemented hus-Struktogrammer
 *        version (Str32). This may be added later.
 *
 ******************************************************************************************************///

import java.awt.Color;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.filechooser.FileFilter;

import org.xml.sax.SAXException;

import lu.fisch.structorizer.elements.Alternative;
import lu.fisch.structorizer.elements.Call;
import lu.fisch.structorizer.elements.Case;
import lu.fisch.structorizer.elements.Element;
import lu.fisch.structorizer.elements.Instruction;
import lu.fisch.structorizer.elements.Repeat;
import lu.fisch.structorizer.elements.Root;
import lu.fisch.structorizer.elements.Subqueue;
import lu.fisch.structorizer.elements.While;
import lu.fisch.structorizer.parsers.INSDImporter;
import lu.fisch.utils.StringList;

/**
 * Importer for NSD files generated by hus-Struktogrammer.
 * @author kay
 */
public class StgrImporter implements INSDImporter {

	private Color elementColor = Color.WHITE;
	public static final Logger logger = Logger.getLogger(NSDParser.class.getName());
	
	/**
	 * Just creates a new importer for hus-Struktogrammer files
	 */
	public StgrImporter() {
	}

	@Override
	public String getDialogTitle() {
		return "hus-Struktogrammer";
	}

	@Override
	public String getFileDescription() {
		return "hus-Struktogrammer files";
	}

	@Override
	public String[] getFileExtensions() {
		// The import of stg files is planned for a later version
		final String[] exts = { "stgr" /*, "stg"*/ };
		return exts;
	}

	@Override
	public FileFilter getFileFilter() {
		return new javax.swing.filechooser.FileFilter() {

			/* (non-Javadoc)
			 * @see javax.swing.filechooser.FileFilter#getDescription()
			 */
			@Override
			public final String getDescription() 
			{
				return getFileDescription();
			}

			/* (non-Javadoc)
			 * @see javax.swing.filechooser.FileFilter#accept(java.io.File)
			 */
			@Override
			public final boolean accept(File f) 
			{
				if (f.isDirectory()) 
				{
					return true;
				}

				String extension = getExtension(f);
				if (extension != null) 
				{
					return isOK(f.getName());
				}

				return false;
			}

		};
	}

	@Override
	public Root parse(String _filename) throws SAXException, IOException {
		URL url = new URL(_filename);
		File file = new File(url.getPath());
		Root root = null;
		try (InputStream is = new FileInputStream(file);) {
			if (!checkFormat(is)) {
				throw new IOException("Wrong file format");
			}
			// Diagram header text
			StringList header = readText(is);
			root = new Root(header);
			is.skip(8);	// Skip width and height (in pixels)
			readText(is);	// Skip font
			is.skip(1);	// Skip a 01 byte
			elementColor = readColor(is);	// Element background
			readColor(is);	// Frame color (not used)
			readColor(is);	// ???
			readColor(is);	// Text colour (not used)
			is.skip(1);	// Skip a 00 byte
			importSubqueue(is, root.children);
			root.origin += " / " + this.getClass().getSimpleName() + ": \"" + file + "\"";
			if (!root.isEmpty()) {
				root.setChanged(false);
			}
		}
		catch (Exception ex) {
			logger.log(Level.WARNING, getDialogTitle() + " import failed!", ex);
			throw ex;
		}
		return root;
	}

	private void importSubqueue(InputStream is, Subqueue sq) throws IOException {
		byte[] elCnt = new byte[1];
		if (is.read(elCnt) > 0) {
			for (int i = 0; i < elCnt[0]; i++) {
				readElement(is, sq);
			}
		}
	}

	private void readElement(InputStream is, Subqueue sq) throws IOException {
		byte code[] = new byte[]{0};
		is.read(code);
		if (code[0] > 0) {
			Element el = null;
			StringList text = readText(is);
			switch (code[0]) {
			case 0x10:
				el = new Instruction(text);
				break;
			case 0x11:
				el = new Call(text);
				break;
			case 0x20:
				el = readAlternative(is, text);
				break;
			case 0x21:
				el = readCase(is, text);
				break;
			case 0x30:
				el = readRepeat(is, text);
				break;
			case 0x31:
				el = readWhile(is, text);
				break;
			}
			if (el != null) {
				el.setColor(elementColor);
				sq.addElement(el);
			}
		}
	}

	private Element readAlternative(InputStream is, StringList text) throws IOException {
		Alternative alt = new Alternative(text);
		readText(is);	// Skip TRUE label
		readText(is);	// Skip FALSE label
		importSubqueue(is, alt.qTrue);
		importSubqueue(is, alt.qFalse);
		return alt;
	}

	private Element readCase(InputStream is, StringList text) throws IOException {
		Case cas = null;
		StringList content = StringList.explode(text.concatenate("\\\n"), "\n");
		byte[] brCnt = new byte[] {0};
		is.read(brCnt);
		if (brCnt[0] > 0) {
			int ixCase = content.count();	// Index of the current case selector
			for (int i = 0; i < brCnt[0]; i++) {
				content.add("???");
			}
			content.add("%");
			cas = new Case(content);
			for (int i = 0; i < brCnt[0]; i++) {
				String sel = importBranch(is, cas.qs.get(i));
				if (sel != null) {
					cas.getText().set(ixCase + i, sel);
				}
			}
		}
		return cas;
	}

	private String importBranch(InputStream is, Subqueue subqueue) throws IOException {
		byte[] code = new byte[1];
		if (is.read(code) < 1 || code[0] != 0x22) {
			return null;
		}
		String selector = readText(is).getLongString();
		importSubqueue(is, subqueue);
		return selector;
	}

	private Element readRepeat(InputStream is, StringList text) throws IOException {
		Repeat loop = new Repeat(StringList.explode(text.concatenate("\\\n"), "\n"));
		importSubqueue(is, loop.q);
		return loop;
	}

	private Element readWhile(InputStream is, StringList text) throws IOException {
		While loop = new While(StringList.explode(text.concatenate("\\\n"), "\n"));
		importSubqueue(is, loop.q);
		return loop;
	}

	private StringList readText(InputStream is) throws IOException {
		StringList strl = null;
		byte[] txtLen = new byte[2];
		if (is.read(txtLen) == txtLen.length) {
			ByteBuffer wrapped = ByteBuffer.wrap(txtLen); // big-endian by default
			short len = wrapped.getShort();
			byte[] text = new byte[len];
			is.read(text);
			String str = new String(text, "UTF-8");
			strl = StringList.explode(str, "\n");
		}
		return strl;
	}
	
	private Color readColor(InputStream is) throws IOException
	{
		Color col = null;
		byte[] colBytes = new byte[4];
		if (is.read(colBytes) == colBytes.length) {
			col = new Color(uByteToInt(colBytes[1]), uByteToInt(colBytes[2]), uByteToInt(colBytes[3]), uByteToInt(colBytes[0]));
		}
		return col;
	}
	
	private static int uByteToInt(byte b)
	{
		return (int)(b & 0xFF);
	}
	
	private boolean checkFormat(InputStream str) throws IOException {
		final byte[] format = new byte[]{0x00, 0x04, 'S', 'T', 'G', 'R', 0x02};
		byte[] header = new byte[format.length];
		if (str.read(header) < format.length) {
			return false;
		}
		for (int i = 0; i < format.length; i++) {
			if (header[i] != format[i]) {
				return false;
			}
		}
		return true;
	}

	private static final String getExtension(File f) 
	{
		String ext = null;
		String s = f.getName();
		int i = s.lastIndexOf('.');
		
		if (i > 0 &&  i < s.length() - 1) 
		{
			ext = s.substring(i+1).toLowerCase();
		}
		
		return ext;
	}
	
	private static final String getExtension(String s) 
	{
		String ext = null;
		int i = s.lastIndexOf('.');
		
		if (i > 0 &&  i < s.length() - 1) 
		{
			ext = s.substring(i+1).toLowerCase();
		}
		return ext;
	}
	
	/**
	 * Internal check for acceptable input files. The default implementation just
	 * compares the filename extension with the extensions configured in and
	 * provided by {@link #getFileExtensions()}. Helper method for method 
	 * {@link #accept(File)}.
	 * @param _filename
	 * @return true if the import file is formally welcome. 
	 */
	protected final boolean isOK(String _filename)
	{
		boolean res = false;
		String ext = getExtension(_filename); 
		if (ext != null)
		{
			for (int i =0; i<getFileExtensions().length; i++)
			{
				res = res || (ext.equalsIgnoreCase(getFileExtensions()[i]));
			}
		}
		return res;
	}
	
}