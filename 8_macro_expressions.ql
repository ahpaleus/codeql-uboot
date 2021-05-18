import cpp

from MacroInvocation m
where
    m.getMacro().getName().regexpMatch("ntoh.*")
select m.getExpr()
