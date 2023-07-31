
function CenterTable=ExtractCircleCentersByPratt(EMstruct)

    Centers=NaN(size(EMstruct,2),3);
    filenames=cell(size(EMstruct,2),1);
    InsidePts=NaN(size(EMstruct,2),2);

    for i=1:size(EMstruct,2)

        Centers(i,:)=CircleFitByPratt(EMstruct(i).curve);
        filenames{i}=EMstruct(i).file;

    end

    a=8*Centers(:,1)/5000;
    b=8*Centers(:,2)/5000;
    R=8*Centers(:,3)/5000;

CenterTable=table(filenames,a,b,R);

end