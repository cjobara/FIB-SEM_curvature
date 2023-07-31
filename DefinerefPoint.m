
function EMrefined=DefinerefPoint(EMstruct)

for i=1:size(EMstruct,2)
    EMstruct(i).refPoint=(8/5000)*EMstruct(i).inside;
end

EMrefined=EMstruct;