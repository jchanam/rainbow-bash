source $RBW_PLUGINS/kubernetes/utils.sh

# Create the variables calling the functions
PROMPT_COMMAND="rbw_k8s_get_context;\
$PROMPT_COMMAND"
