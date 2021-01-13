function commitReport
dos('git fetch');
dos('git checkout commitPush');
% Run model advisor for sim_autotrans.
file_path = fileparts(mfilename('fullpath'));
report_dir = [file_path filesep 'Report'];
model_dir = [file_path filesep 'ModelFile'];
addpath(genpath(model_dir));
model_names = {'sim_autotrans','sf_car'};
for ii = 1:length(model_names)
    % Load the model.
    cd(report_dir);
    load_system(model_names{ii});
    % Run the model advisor.
    ma = Simulink.ModelAdvisor.getModelAdvisor(model_names{ii});
    ma.selectCheckAll;
    ma.runCheck;
    reportPath = [cd filesep 'slprj\modeladvisor\' model_names{ii} filesep 'report.html'];
    % Commit the report.
    movefile(reportPath,[file_path filesep model_names{ii} '.html']);
    close_system(model_names{ii});
end
cd(file_path);

end