function runModelAdvisor
% Checkout the recently commited branch.

% load the model.
load_system('sim_autotrans');
ma = Simulink.ModelAdvisor.getModelAdvisor('sim_autotrans');
ma.selectCheckAll;
ma.runCheck;
end