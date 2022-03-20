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


includes:
    %include "./libs/basicIO.mac"
    %include "./libs/blockLogic.mac"
    ;; %include "./libs/draw.mac"

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    ;; call fillChoiceMenu
    ;; call fillhighScoreScreen
    jmp main


    ;Código do projeto...
macros:
    ;; %macro input1 0
    ;;     call getKey
    ;;     call validateKey1

    ;; %endmacro

    ;; %macro input2 0
    ;;     call getKey
    ;;     call validateKey2

    ;; %endmacro

    ;; %macro renderLoop 0
    ;;         call applyColorLoop
    ;;         call drawSpacing
    ;;         call drawFillBlockColor
    ;;         call drawRows
    ;;         call drawNumbers
    ;; %endmacro

    ;; %macro looping 0
    ;;     mov [actualFunc], dx
    ;;     call loopGrid
    ;; %endmacro

main:
    screens:
        menuScreen:
            ;; call drawMenuScreen
            input1               ;block

        creditsScreen:
        ;;     call drawCreditsScreen
        ;;     call getKey
            jmp menuScreen

        gameOverScreen:
        ;;     call drawGameOverScreen
        ;;     call getKey
            jmp menuScreen

        highScore:
        ;;     call drawTopScoresScreen
        ;;     call getKey
            jmp menuScreen

        winScreen:
        ;;     call isBetterScore
        ;;     call drawWinScreen
        ;;     call getKey
            jmp menuScreen

    action:
            ;; mov dx, isGameOver
            ;; looping
            ;; input2

        move:
    ;;         mov dx, moveBlocks
    ;;         looping
    ;;         looping
    ;;         looping

        match:
    ;;         mov dx, directionMatch
    ;;         looping
    ;;         looping
    ;;         looping

        spawn:
    ;;         call fillBlock
    ;;         ;; renderLoop
            ;; jmp action
end:

jmp $
