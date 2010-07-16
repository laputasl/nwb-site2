module FeedsHelper
  def category_names prod, store = nil
    cats = all_category_names(prod)
    unless prod.store == store || store.nil?
      if store.code == 'pwb'
        cats.unshift "Owners"
      else
        cats.unshift "Pets"
      end
    end
    cats
  end
  
  def all_category_names prod
    deepest = prod.taxons.inject(nil) do |memo, tax|
      unless tax.permalink.match(/^c\//).nil?
        unless memo.nil?
          this_parts = tax.permalink.split("/")
          that_parts = memo.permalink.split("/")
          if this_parts.size > that_parts.size
            memo = tax
          end
        else
          memo = tax
        end        
      end
      memo
    end
    unless deepest.nil?
      names = deepest.ancestors.map do |tax|
        if tax.permalink.split("/").size > 1
          tax.name
        else
          nil
        end
      end
      names << deepest.name
      names.compact 
    else
      []
    end
  end
  
  def product_brand_name prod
    brand = prod.taxons.detect do | tax|
      !tax.permalink.match(/^b\//).nil?
    end
    brand.name unless brand.nil?
  end
  
  def cse_taxon prod, name
    prod.taxons.detect do |tax|
       !tax.permalink.match(%r(^custom-search-engines\/#{name}\/)).nil?
    end    
  end
  
  def html_to_text html
    word_wrap(strip_tags(to_numeric_entities(html).gsub(/\s+/, " ").gsub(/>\s*</, ">\n<").gsub(/<\/p>\s*/, "</p>\n\n").gsub(/<br\/?>/, "<br>\n")), :line_length => 78).gsub(/\n\s*\n\s*/, "\n\n")
  end
  NUMERIC_ENTITIES = {
    "&Aacute;"   => "&#xC1;",
    "&aacute;"   => "&#xE1;",
    "&Acirc;"    => "&#xC2;",
    "&acirc;"    => "&#xE2;",
    "&acute;"    => "&#xB4;",
    "&AElig;"    => "&#xC6;",
    "&aelig;"    => "&#xE6;",
    "&Agrave;"   => "&#xC0;",
    "&agrave;"   => "&#xE0;",
    "&alefsym;"  => "&#x2135;",
    "&Alpha;"    => "&#x391;",
    "&alpha;"    => "&#x3B1;",
    "&amp;"      => "&#x26;",
    "&and;"      => "&#x2227;",
    "&ang;"      => "&#x2220;",
    "&Aring;"    => "&#xC5;",
    "&aring;"    => "&#xE5;",
    "&asymp;"    => "&#x2248;",
    "&Atilde;"   => "&#xC3;",
    "&atilde;"   => "&#xE3;",
    "&Auml;"     => "&#xC4;",
    "&auml;"     => "&#xE4;",
    "&bdquo;"    => "&#x201E;",
    "&Beta;"     => "&#x392;",
    "&beta;"     => "&#x3B2;",
    "&brvbar;"   => "&#xA6;",
    "&bull;"     => "&#x2022;",
    "&cap;"      => "&#x2229;",
    "&Ccedil;"   => "&#xC7;",
    "&ccedil;"   => "&#xE7;",
    "&cedil;"    => "&#xB8;",
    "&cent;"     => "&#xA2;",
    "&Chi;"      => "&#x3A7;",
    "&chi;"      => "&#x3C7;",
    "&circ;"     => "&#x2C6;",
    "&clubs;"    => "&#x2663;",
    "&cong;"     => "&#x2245;",
    "&copy;"     => "&#xA9;",
    "&crarr;"    => "&#x21B5;",
    "&cup;"      => "&#x222A;",
    "&curren;"   => "&#xA4;",
    "&dagger;"   => "&#x2020;",
    "&Dagger;"   => "&#x2021;",
    "&darr;"     => "&#x2193;",
    "&dArr;"     => "&#x21D3;",
    "&deg;"      => "&#xB0;",
    "&Delta;"    => "&#x394;",
    "&delta;"    => "&#x3B4;",
    "&diams;"    => "&#x2666;",
    "&divide;"   => "&#xF7;",
    "&Eacute;"   => "&#xC9;",
    "&eacute;"   => "&#xE9;",
    "&Ecirc;"    => "&#xCA;",
    "&ecirc;"    => "&#xEA;",
    "&Egrave;"   => "&#xC8;",
    "&egrave;"   => "&#xE8;",
    "&empty;"    => "&#x2205;",
    "&emsp;"     => "&#x2003;",
    "&ensp;"     => "&#x2002;",
    "&Epsilon;"  => "&#x395;",
    "&epsilon;"  => "&#x3B5;",
    "&equiv;"    => "&#x2261;",
    "&Eta;"      => "&#x397;",
    "&eta;"      => "&#x3B7;",
    "&ETH;"      => "&#xD0;",
    "&eth;"      => "&#xF0;",
    "&Euml;"     => "&#xCB;",
    "&euml;"     => "&#xEB;",
    "&euro;"     => "&#x20AC;",
    "&exist;"    => "&#x2203;",
    "&fnof;"     => "&#x192;",
    "&forall;"   => "&#x2200;",
    "&frac12;"   => "&#xBD;",
    "&frac14;"   => "&#xBC;",
    "&frac34;"   => "&#xBE;",
    "&frasl;"    => "&#x2044;",
    "&Gamma;"    => "&#x393;",
    "&gamma;"    => "&#x3B3;",
    "&ge;"       => "&#x2265;",
    "&gt;"       => "&#x3E;",
    "&harr;"     => "&#x2194;",
    "&hArr;"     => "&#x21D4;",
    "&hearts;"   => "&#x2665;",
    "&hellip;"   => "&#x2026;",
    "&Iacute;"   => "&#xCD;",
    "&iacute;"   => "&#xED;",
    "&Icirc;"    => "&#xCE;",
    "&icirc;"    => "&#xEE;",
    "&iexcl;"    => "&#xA1;",
    "&Igrave;"   => "&#xCC;",
    "&igrave;"   => "&#xEC;",
    "&image;"    => "&#x2111;",
    "&infin;"    => "&#x221E;",
    "&int;"      => "&#x222B;",
    "&Iota;"     => "&#x399;",
    "&iota;"     => "&#x3B9;",
    "&iquest;"   => "&#xBF;",
    "&isin;"     => "&#x2208;",
    "&Iuml;"     => "&#xCF;",
    "&iuml;"     => "&#xEF;",
    "&Kappa;"    => "&#x39A;",
    "&kappa;"    => "&#x3BA;",
    "&Lambda;"   => "&#x39B;",
    "&lambda;"   => "&#x3BB;",
    "&lang;"     => "&#x2329;",
    "&laquo;"    => "&#xAB;",
    "&larr;"     => "&#x2190;",
    "&lArr;"     => "&#x21D0;",
    "&lceil;"    => "&#x2308;",
    "&ldquo;"    => "&#x201C;",
    "&le;"       => "&#x2264;",
    "&lfloor;"   => "&#x230A;",
    "&lowast;"   => "&#x2217;",
    "&loz;"      => "&#x25CA;",
    "&lrm;"      => "&#x200E;",
    "&lsaquo;"   => "&#x2039;",
    "&lsquo;"    => "&#x2018;",
    "&lt;"       => "&#x3C;",
    "&macr;"     => "&#xAF;",
    "&mdash;"    => "&#x2014;",
    "&micro;"    => "&#xB5;",
    "&middot;"   => "&#xB7;",
    "&minus;"    => "&#x2212;",
    "&Mu;"       => "&#x39C;",
    "&mu;"       => "&#x3BC;",
    "&nabla;"    => "&#x2207;",
    "&nbsp;"     => "&#xA0;",
    "&ndash;"    => "&#x2013;",
    "&ne;"       => "&#x2260;",
    "&ni;"       => "&#x220B;",
    "&not;"      => "&#xAC;",
    "&notin;"    => "&#x2209;",
    "&nsub;"     => "&#x2284;",
    "&Ntilde;"   => "&#xD1;",
    "&ntilde;"   => "&#xF1;",
    "&Nu;"       => "&#x39D;",
    "&nu;"       => "&#x3BD;",
    "&Oacute;"   => "&#xD3;",
    "&oacute;"   => "&#xF3;",
    "&Ocirc;"    => "&#xD4;",
    "&ocirc;"    => "&#xF4;",
    "&OElig;"    => "&#x152;",
    "&oelig;"    => "&#x153;",
    "&Ograve;"   => "&#xD2;",
    "&ograve;"   => "&#xF2;",
    "&oline;"    => "&#x203E;",
    "&Omega;"    => "&#x3A9;",
    "&omega;"    => "&#x3C9;",
    "&Omicron;"  => "&#x39F;",
    "&omicron;"  => "&#x3BF;",
    "&oplus;"    => "&#x2295;",
    "&or;"       => "&#x2228;",
    "&ordf;"     => "&#xAA;",
    "&ordm;"     => "&#xBA;",
    "&Oslash;"   => "&#xD8;",
    "&oslash;"   => "&#xF8;",
    "&Otilde;"   => "&#xD5;",
    "&otilde;"   => "&#xF5;",
    "&otimes;"   => "&#x2297;",
    "&Ouml;"     => "&#xD6;",
    "&ouml;"     => "&#xF6;",
    "&para;"     => "&#xB6;",
    "&part;"     => "&#x2202;",
    "&permil;"   => "&#x2030;",
    "&perp;"     => "&#x22A5;",
    "&Phi;"      => "&#x3A6;",
    "&phi;"      => "&#x3C6;",
    "&Pi;"       => "&#x3A0;",
    "&pi;"       => "&#x3C0;",
    "&piv;"      => "&#x3D6;",
    "&plusmn;"   => "&#xB1;",
    "&pound;"    => "&#xA3;",
    "&prime;"    => "&#x2032;",
    "&Prime;"    => "&#x2033;",
    "&prod;"     => "&#x220F;",
    "&prop;"     => "&#x221D;",
    "&Psi;"      => "&#x3A8;",
    "&psi;"      => "&#x3C8;",
    "&quot;"     => "&#x22;",
    "&radic;"    => "&#x221A;",
    "&rang;"     => "&#x232A;",
    "&raquo;"    => "&#xBB;",
    "&rarr;"     => "&#x2192;",
    "&rArr;"     => "&#x21D2;",
    "&rceil;"    => "&#x2309;",
    "&rdquo;"    => "&#x201D;",
    "&real;"     => "&#x211C;",
    "&reg;"      => "&#xAE;",
    "&rfloor;"   => "&#x230B;",
    "&Rho;"      => "&#x3A1;",
    "&rho;"      => "&#x3C1;",
    "&rlm;"      => "&#x200F;",
    "&rsaquo;"   => "&#x203A;",
    "&rsquo;"    => "&#x2019;",
    "&sbquo;"    => "&#x201A;",
    "&Scaron;"   => "&#x160;",
    "&scaron;"   => "&#x161;",
    "&sdot;"     => "&#x22C5;",
    "&sect;"     => "&#xA7;",
    "&shy;"      => "&#xAD;",
    "&Sigma;"    => "&#x3A3;",
    "&sigma;"    => "&#x3C3;",
    "&sigmaf;"   => "&#x3C2;",
    "&sim;"      => "&#x223C;",
    "&spades;"   => "&#x2660;",
    "&sub;"      => "&#x2282;",
    "&sube;"     => "&#x2286;",
    "&sum;"      => "&#x2211;",
    "&sup1;"     => "&#xB9;",
    "&sup2;"     => "&#xB2;",
    "&sup3;"     => "&#xB3;",
    "&sup;"      => "&#x2283;",
    "&supe;"     => "&#x2287;",
    "&szlig;"    => "&#xDF;",
    "&Tau;"      => "&#x3A4;",
    "&tau;"      => "&#x3C4;",
    "&there4;"   => "&#x2234;",
    "&Theta;"    => "&#x398;",
    "&theta;"    => "&#x3B8;",
    "&thetasym;" => "&#x3D1;",
    "&thinsp;"   => "&#x2009;",
    "&THORN;"    => "&#xDE;",
    "&thorn;"    => "&#xFE;",
    "&tilde;"    => "&#x2DC;",
    "&times;"    => "&#xD7;",
    "&trade;"    => "&#x2122;",
    "&Uacute;"   => "&#xDA;",
    "&uacute;"   => "&#xFA;",
    "&uarr;"     => "&#x2191;",
    "&uArr;"     => "&#x21D1;",
    "&Ucirc;"    => "&#xDB;",
    "&ucirc;"    => "&#xFB;",
    "&Ugrave;"   => "&#xD9;",
    "&ugrave;"   => "&#xF9;",
    "&uml;"      => "&#xA8;",
    "&upsih;"    => "&#x3D2;",
    "&Upsilon;"  => "&#x3A5;",
    "&upsilon;"  => "&#x3C5;",
    "&Uuml;"     => "&#xDC;",
    "&uuml;"     => "&#xFC;",
    "&weierp;"   => "&#x2118;",
    "&Xi;"       => "&#x39E;",
    "&xi;"       => "&#x3BE;",
    "&Yacute;"   => "&#xDD;",
    "&yacute;"   => "&#xFD;",
    "&yen;"      => "&#xA5;",
    "&Yuml;"     => "&#x178;",
    "&yuml;"     => "&#xFF;",
    "&Zeta;"     => "&#x396;",
    "&zeta;"     => "&#x3B6;",
    "&zwj;"      => "&#x200D;",
    "&zwnj;"     => "&#x200C;"
  }
  def to_numeric_entities str
    str.gsub(/&[^;]+;/){ |s| NUMERIC_ENTITIES[s]}
  end
  
end