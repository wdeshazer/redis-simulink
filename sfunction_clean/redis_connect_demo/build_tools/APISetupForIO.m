%% Path Variables;
CODE = '$(MATLAB_ROOT)/toolbox/coder';
rtio_src = [CODE '/rtiostream/src/rtiostreamtcpip/rtiostream_tcpip.c'];

apiImp = ...
  target.create('APIImplementation', 'Name', 'x86 rtiostream Implementation');

apiImp.API = target.create('API', 'Name', 'rtiostream');

apiImp.BuildDependencies = target.create('BuildDependencies');


apiImp.BuildDependencies.SourceFiles = {rtio_src};

apiImp.MainFunction = target.create('MainFunction', 'Name', 'TCP RtIOStream Main');

apiImp.MainFunction.Arguments = {'-blocking', '1', '-port', '0'};

mingwtc.Builder = target.create('MakefileBuilder', 'GMake');
