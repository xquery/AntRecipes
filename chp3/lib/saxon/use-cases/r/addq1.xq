(: test sort with explicit collation :)
<result>
  {
    for $u in doc("users.xml")//user_tuple
    let $b := doc("bids.xml")//bid_tuple[userid = $u/userid]
    order by $u/name collation "http://saxon.sf.net/collation?lang=sv;strength=primary"
    return
        <user>
            { $u/userid }
            { $u/name }
            {
                if (empty($b))
                  then <status>inactive</status>
                  else <status>active</status>
            }
        </user>
  }
</result>