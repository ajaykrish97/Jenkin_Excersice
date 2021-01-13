classdef simModelTest < matlab.unittest.TestCase
    properties
        model = 'sf_car';
    end
    
    methods (TestClassSetup)
        function loadModel(testCase)
            load_system(testCase.model)
        end
    end
    
    methods (TestClassTeardown)
        function closeModel(testCase)
            bdclose(testCase.model)
        end
    end
    
    methods(Test)
        function runModelAdvisor(testCase)
            ma = Simulink.ModelAdvisor.getModelAdvisor(testCase.model);
            ma.selectCheckAll;
            ma.runCheck;
        end
    end
end