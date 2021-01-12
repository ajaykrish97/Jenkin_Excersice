classdef simModelTest < matlab.unittest.TestCase
    methods(Test)
        function runModelAdvisor(testCase)
            % fetch the branches.
            [status,message] = dos('git fetch');
            if status
                testCase.verifyFail('Git fetch failture');
                return;
            end
            % Checkout the branch name runTest.
            [status,~] = dos('git checkout runTest');
            if status
                testCase.verifyFail('Git switch failture');
                return;
            end
            % load the model.
            load_system('sf_car');
            ma = Simulink.ModelAdvisor.getModelAdvisor('sf_car');
            ma.selectCheckAll;
            ma.runCheck;
        end
    end
end