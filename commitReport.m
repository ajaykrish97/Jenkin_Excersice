function commitReport
% Run model advisor for sim_autotrans.
file_path = mfilepath(fullfile);
report_dir = [file_path fileparts 'Report'];
model_dir = [file_path fileparts 'ModelFile'];
addpath(model_dir);
model_names = {'sim_autotrans','sf_car'};
for ii = 1:length(model_names)
    % Load the model.
    cd(report_dir);
    load_system(model_names{ii});
    % Run the model advisor.
    ma = Simulink.ModelAdvisor.getModelAdvisor(model_names{ii});
    ma.selectCheckAll;
    ma.runCheck;
    reportPath = [cd fileparts 'slprj\modeladvisor\' model_names{ii} fileparts 'report.html'];
    % Commit the report.
    movefile(reportPath,file_path);
    [status,~] = git(
end

end