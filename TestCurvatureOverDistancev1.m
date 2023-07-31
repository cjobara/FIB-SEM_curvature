
function TestCurvatureOverDistancev1(EMstruct,index)

    CurvLength=size(EMstruct(index).curve,1);

    for i=5:10
        Analyze1Dcurve_v1(smoothdata(EMstruct(index).curve,1,"movmean",4*(i-1)+1));
    end

end