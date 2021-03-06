
declare namespace my="my.uri";
declare function my:partners($company as xs:string) as element()*
{
    let $c := doc("company-data.xml")//company[name = $company]
    return $c//partner
};

let $foobar_partners := my:partners("Foobar Corporation")

for $item in //news_item
where
  some $t in $item//title satisfies
    (contains($t/text(), "Foobar Corporation")
    and (some $partner in $foobar_partners satisfies
      contains($t/text(), $partner/text())))
  or (some $par in $item//par satisfies
   (contains(string($par), "Foobar Corporation")
     and (some $partner in $foobar_partners satisfies
        contains(string($par), $partner/text())))) 
return
    <news_item>
        { $item/title }
        { $item/date }
    </news_item>