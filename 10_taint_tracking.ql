/**
 * @kind path-problem
 */

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr {
    NetworkByteSwap() {
        // TODO: replace <class> and <var>
        exists(MacroInvocation m | 
                m.getMacro().getName().regexpMatch("ntoh.*")
            and
                this = m.getExpr()
            )

    }
}

class Config extends TaintTracking::Configuration {
    Config() { this = "NetworkToMemFuncLength" }

    override predicate isSource(DataFlow::Node source) {
        source.asExpr() instanceof NetworkByteSwap
    }

    override predicate isSink(DataFlow::Node sink) {
        // TODO
        exists (FunctionCall fc | sink.asExpr() = fc.getArgument(2) and
        fc.getTarget().hasQualifiedName("memcpy"))
    }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"

