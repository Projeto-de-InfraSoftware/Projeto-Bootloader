org 0x7e00
jmp 0x0000:start

data:
	
    gridArray times 16 dw 0     ; Allocate grid size notice that maximum value per grid is 2048, but we do this for alignment reasons
    ;; colorArray dw 0             ; Alloctae the color array for later mapping
    ;; scoreArray times 5 dw 0     ;Allocate the score array for high score queries
    directionKey db 0      ;Allocate 1 byte for the possible 4directions
    actualGridPos dw 0     ;Allocate 1 word for the actual grid position
    actualFunc dw 0        ;Allocate 1 word for function address
    choiceMenu times 4 dw 'START','CREDITS','QUIT','RETURN'     ;options in the main screens
    choiceMenuPos dw 0     ;actual option in the main screen
    scoreArray times 10 dw 0             ;score data, 12bits score, 3bits name
    enzo db 'Enzo Bissoli ~ egb2', 0
    lucas db 'Lucas Monterazo ~ lsm6', 0
    matheus db 'Matheus Lafayette ~ mlv', 0
    credits db 'CREDITOS', 0
    anykey db 'Aperte qualquer tecla para prosseguir', 0
    gameOver db 'GAME OVER', 0
    finalScore db 'Placar final:',0
    youWin db 'Parabens, voce venceu!',0
    bar db '____________________________________',0
    verticalBar db ' | ',0
    string times 10 db 0
    p0 db '0    ', 0
    p2 db '2    ', 0
    p4 db '4    ', 0
    p8 db '8    ', 0
    p16 db '16   ', 0
    p32 db '32   ', 0
    p64 db '64   ', 0
    p128 db '128  ', 0
    p256 db '256  ', 0
    p512 db '512  ', 0
    p1024 db '1024 ', 0
    p2048 db '2048 ', 0
    actualGridVal dw 0          ;store value


includes:
    %include "./libs/basicIO.mac"
    %include "./libs/blockLogic.mac"
    %include "./libs/draw.mac"

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    call setvideo
    ;; call fillChoiceMenu
    ;; call fillhighScoreScreen
    jmp main
    seedRandom


    ;Código do projeto...
macros:
    %macro input1 0
        call getKey
        call validateKey1

    %endmacro

    %macro input2 0
        call getKey
        call validateKey2

    %endmacro

    ;; %macro renderLoop 0
    ;;         call applyColorLoop
    ;;         call drawSpacing
    ;;         call drawFillBlockColor
    ;;         call drawRows
    ;;         call drawNumbers
    ;; %endmacro

    %macro looping 0
        mov [actualFunc], dx
        call loopGrid
    %endmacro

main:
    screens:
        menuScreen:
            ;; call drawMenuScreen
            ;; input1               ;block

        creditsScreen:
            drawCreditsScreen
            jmp gameOverScreen

        gameOverScreen:
            drawGameOverScreen
            jmp winScreen

        highScore:
        ;;     call drawTopScoresScreen
        ;;     call getKey
            ;; jmp menuScreen

        winScreen:
            ;; isBetterScore
            drawWinScreen
            ;; jmp creditsScreen

            call fillBlock
    action:
            ;; mov dx, isGameOver
            ;; looping
            input2

        move:
            mov dx, moveBlocks
            ;; looping
            ;; looping
            ;; looping

        match:
            mov dx, directionMatch
            ;; looping
            ;; looping
            ;; looping

        spawn:
            ;; call fillBlock
            inicdisplay
            jmp action
end:

jmp $
