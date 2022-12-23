%------PART 1------
A=ReadMyImage('Part5.bmp');
DisplayMyImage(A);

%------PART 2------

%testing functions

x = zeros(10,10);
x(1,1)=1;
x(2,2)=1;
x(2,3)=1;
xmn = get_xmn(x,2,3);
ymn = get_ymn(x,2,3);
ymn_v2 = get_ymn_v2(x,1,1);

%function definitions

%defining 2D discrete impulse signal
function delta = delta(m, n)
    if m == 0 && n == 0
        delta = 1;
    else
        delta = 0;
    end
end

%define the input signal x[m,n] as a
% superposition of shifted impulse as xmn
function xmn = get_xmn(x,m,n)
    xmn = 0;
    for k = -inf:inf        %1:size(x,1)
        for l = -inf:inf    %1:size(x,2)
            xmn = xmn + x(k,l)*delta(m-k,n-l);
        end
    end
end

%name the response that the system gives to delta(m,n) as h(n) 
function h = h(m, n)
    if m == 0 && n == 0
        h = 1;
    else
        h = 0;
    end
end

function ymn = get_ymn(x,m,n)
    ymn = 0;
    for k = -inf:inf        %1:size(x,1)
        for l = -inf:inf    %1:size(x,2)
            ymn = ymn + x(k,l)*h(m-k,n-l);
        end
    end
end

%notation
function ymn = get_ymn_v2(x,m,n)
    ymn = conv2(x(m,n),h(m-1,n-1));
end
