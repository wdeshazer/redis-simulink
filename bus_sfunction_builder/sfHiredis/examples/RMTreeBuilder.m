classdef RMTreeBuilder
  %RMTree Primitive directory tree building utility
  %   Detailed explanation goes here
  % fig = uifigure("Position",[300 300 350 400]);
  % t = uitree(fig);
  %
  % % Parent nodes
  % n1 = uitreenode(t,"Text","App 1");
  % n2 = uitreenode(t,"Text","App 2");
  % n3 = uitreenode(t,"Text","Images");
  %
  % % Child nodes
  % n11 = uitreenode(n1,"Text","myapp1.m");
  % n21 = uitreenode(n2,"Text","myapp2.m");
  % n22 = uitreenode(n2,"Text","app2callback.m");
  % n31 = uitreenode(n3,"Text","peppers.png");

  %expand(t)
  properties
    tree
    styles
  end

  methods
    function obj = RMTreeBuilder(inputArg)
      %RMTree
      %   Detailed explanation goes here
      obj.tree = uitree(inputArg1);
      obj.styles = struct( ...
        'dirStyle', uistyle("FontWeight","bold"), ...
        'mStyle', uistyle("FontAngle","italic"), ...
        'imgStyle', uistyle("Icon","peppers.png") ...
        );
    end

    function outputArg = method1(obj,inputArg)
      %METHOD1 Summary of this method goes here
      %   Detailed explanation goes here
      outputArg = obj.tree + inputArg;
    end
  end
end