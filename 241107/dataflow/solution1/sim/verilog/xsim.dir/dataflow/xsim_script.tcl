set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {dataflow} -view {{dataflow_dataflow_ana.wcfg}} -tclbatch {dataflow.tcl} -protoinst {dataflow.protoinst}
