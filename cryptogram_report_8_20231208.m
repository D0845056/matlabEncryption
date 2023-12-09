% 以ASCII表作訊息加/解密(4X4矩陣雙重加/解密)

% 加密矩陣A,B
A = [ 2   0   0   1 ; 
      1   0   1   0 ; 
      9  13   1  27 ; 
      3   0  11   8  ];

B = [ 1   0   1   0 ; 
      1   3  27   8 ; 
      6   7  18  33 ; 
      0   2  11   5  ];

% 功能選擇

while 1
    choice = input('1、加密\n2、解密\n3、結束程式\n請選擇(1或2或3): ');

    if choice == 1
        encryption(A, B)
    elseif choice == 2
        decryption(A, B)
    elseif choice == 3
        fprintf('程式結束!\n')
        break;
    end
end



% 加密
function encryption(A, B)
    message = input('請輸入要加密的訊息: ', 's');
    messageDoub = double(message);
    
    % 不足四個的地方補零
    if mod(length(messageDoub), 4) ~= 0
        messageDoub = [messageDoub, zeros(1, 4 - mod(length(messageDoub), 4))];
    end
    
    messageMatix = reshape(messageDoub, 4, length(messageDoub)/4);
    encryptionMatrix = messageMatix' * A * B;
    encryptionCode = reshape(encryptionMatrix', 1, length(messageDoub));

    fprintf('加密結果:');
    for i = 1:length(encryptionCode)
        fprintf(' %d', encryptionCode(i))
    end
    fprintf('\n');
end    

% 解密
function decryption(A, B)
    encryptionCode = str2num(input('請輸入要解密的訊息: ', 's'));

    encryptionMatrix = reshape(encryptionCode, 4, length(encryptionCode)/4);
    messageMatix = encryptionMatrix' * inv(B) * inv(A);
    messageAscii = reshape(messageMatix', 1, length(encryptionCode));

    fprintf('解密結果:');
    messageAscii = int64(messageAscii);
    for i = 1:length(messageAscii)
        if messageAscii(i) ~= 0
            fprintf('%c', char(messageAscii(i)))
        end
    end
    fprintf('\n');
end