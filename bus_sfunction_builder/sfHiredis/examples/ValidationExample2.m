classdef ValidationExample2
   properties
      Prop (1,:) double {mustBeReal,mustBeGreaterThan(Prop,10)} = 200;
   end

   methods
       function obj = ValidationExample2(Prop)
           p = inputParser;
           p.FunctionName = 'ValidationExample';

           defaultProp = 200;
           validProp = @(x) isdouble(x) && isreal(x) && x > 10;
           p.addOptional('Prop', defaultProp, validProp)
           obj.Prop = parse(p, Prop);

       end
   end
end