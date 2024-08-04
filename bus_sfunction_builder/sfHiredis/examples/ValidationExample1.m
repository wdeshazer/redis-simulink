classdef ValidationExample1
   properties
      Prop (1,:) double {mustBeReal,mustBeGreaterThan(Prop,10)} = 200;
   end

   methods
       function obj = ValidationExampleq(Prop)
           arguments
               Prop (1,:) double {mustBeReal,mustBeGreaterThan(Prop,10)}
           end
           obj.Prop = Prop;
       end
   end
end