// import cpp

// from Macro m
// where m.getName() = "ntohs" 
// or m.getName() = "ntohl" 
// or m.getName() = "ntohll"
// select m, "found ntohs/ntohl/ntohll function"


// Literal expression
// import cpp
// from Macro m
// where m.getName() in ["ntohs", "ntohl", "ntohll"]
// select m, "found it!"

// Regexp (java.util.Pattern regexp convention)
import cpp
from Macro m
where m.getName().regexpMatch("ntohs|ntohl|ntohll")
select m, "found it too by using regexp"