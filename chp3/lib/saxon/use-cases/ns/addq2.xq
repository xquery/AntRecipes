xquery version "1.0";

(: Additional use case to demonstrate use of default element namespace :)

declare default element namespace "http://www.example.com/AuctionWatch";

<Q7>
  {
    for $a in //Auction
    return
        <a seller="{$a/Trading_Partners/Seller/*:ID}"
           buyer="{$a/Trading_Partners/High_Bidder/*:ID}"
           />
  }
</Q7>