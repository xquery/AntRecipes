<result>
  {
    let $x := .//xref[@xrefid = "top4"],
        $t := .//title[. << $x]
    return $t[last()]
  }
</result>