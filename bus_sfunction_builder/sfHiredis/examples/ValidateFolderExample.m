classdef ValidateFolderExample

    properties
        subfolders cell {mustBeFolder}
    end

    methods
        function obj = ValidateFolderExample(prop)
            obj.subfolders = {prop};
        end

        function add_folder(obj, prop)
            append(obj.subfolders, prop)
        end
    end
end