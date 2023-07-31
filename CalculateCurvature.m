
function [CurvTable]=CalculateCurvature(EMstruct,MaxR)

if nargin==1
    % I define R> 1 micron as absurd since mitochondria are never that big,
    % but update based on application
    MaxR=1;
end

    % Make sure the refPoint is right
    EMstruct=DefinerefPoint(EMstruct);

    Centers=NaN(size(EMstruct,2),3);
    filenames=cell(size(EMstruct,2),1);
    InsidePts=NaN(size(EMstruct,2),2);
    CurvScale=NaN(size(EMstruct,2),1);

    % Calculation loop
    for i=1:size(EMstruct,2)

        Centers(i,:)=CircleFitByPratt(EMstruct(i).curve);
        filenames{i}=EMstruct(i).file;
        InsidePts(i,:)=EMstruct(i).refPoint;

    end

    PrattCenter=8*Centers(:,1:2)/5000;
    R=8*Centers(:,3)/5000;
    refPoints=InsidePts;

    ErrorDistance=sqrt((PrattCenter(:,1)-refPoints(:,1)).^2+(PrattCenter(:,2)-refPoints(:,2)).^2);    % Distance between refPoint and center
    CurvScale(ErrorDistance>R)=-1;
    CurvScale(ErrorDistance<R)=1;
    CurvScale(R>MaxR)=0; % fits bigger than allowed are interpreted as bad fits and given "neutral curvature" values

    Rcurv=R.*CurvScale;


CurvTable=table(filenames,R,PrattCenter,refPoints,CurvScale,Rcurv);
CurvTable=renamevars(CurvTable,{'filenames','R','PrattCenter','refPoints','CurvScale','Rcurv'},{'file','R (\mum)','Pratt Center','Reference Point', 'Curvature Classification', 'Radius of Curvature'});
    

end