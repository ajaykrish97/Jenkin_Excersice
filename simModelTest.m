classdef simModelTest < matlab.unittest.TestCase
    methods(Test)
        function runModelAdvisor(testCase)
            % load the model.
            load_system('sf_car');
            ma = Simulink.ModelAdvisor.getModelAdvisor('sf_car');
            ma.selectCheckAll;
            ma.runCheck;
        end
    end
end