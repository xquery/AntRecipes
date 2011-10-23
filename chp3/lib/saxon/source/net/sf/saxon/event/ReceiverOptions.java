package net.sf.saxon.event;


/**
  * ReceiverOptions defines a set of constants, which can be used in
  * calls to methods on the Receiver interface. The values are
  * bit-significant.
  *
  * @author Michael H. Kay
  */


public class ReceiverOptions {

    /**
    * Flag to disable output escaping
    */

    public static final int DISABLE_ESCAPING = 1;

    /**
    * Flag indicating that the value contains no special characters
    * that need to be escaped
    */

    public static final int NO_SPECIAL_CHARS = 4;

    /**
     * Flag indicating that an attribute value was added by the schema processor
     * because a default value was specified
     */

    public static final int DEFAULTED_ATTRIBUTE = 8;
    
    /**
    * Flag indicating that duplicate values should be rejected
    */

    public static final int REJECT_DUPLICATES = 32;

    /**
     * Flag indicating that the namespace (of an element or attribute name)
     * has already been declared; it does not need to be generated by the namespace
     * fixup process.
     */

    public static final int NAMESPACE_OK = 64;

    /**
     * Flag passed on startElement indicating that the element does not inherit
     * the namespaces of its ancestors.
     */

    public static final int DISINHERIT_NAMESPACES = 128;

    /**
     * Flag used when an attribute value or text node contains null characters
     * before and after strings generated by character mapping; these strings
     * are to be output without escaping
     */

    public static final int USE_NULL_MARKERS = 256;

    /**
     * Flag indicating that an element or attribute annotated as an xs:QName or
     * xs:NOTATION has been lexically checked but still requires a check that the
     * prefix is in scope
     */

    public static final int NEEDS_PREFIX_CHECK = 512;

    /**
     * Flag indicating that an attribute is an ID attribute, described as such in a DTD
     */

    public static final int DTD_ID_ATTRIBUTE = 1024;

    /**
     * Flag indicating that an attribute is an IDREF or IDREFS attribute, described as such in a DTD
     */

    public static final int DTD_IDREFS_ATTRIBUTE = 2048;

}

//
// The contents of this file are subject to the Mozilla Public License Version 1.0 (the "License");
// you may not use this file except in compliance with the License. You may obtain a copy of the
// License at http://www.mozilla.org/MPL/
//
// Software distributed under the License is distributed on an "AS IS" basis,
// WITHOUT WARRANTY OF ANY KIND, either express or implied.
// See the License for the specific language governing rights and limitations under the License.
//
// The Original Code is: all this file,C.
//
// The Initial Developer of the Original Code is Michael H. Kay.
//
// Contributor(s):
//