org 0x7e00
jmp 0x0000:start

data:
	
    gridArray times 16 dw 0     ; Allocate grid size notice that maximum value per grid is 2048, but we do this for alignment reasons
    colorArray dw 0             ; Alloctae the color array for later mapping
    scoreArray times 5 dw 0     ;Allocate the score array for high score queries


start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    jmp main
    
    ;Código do projeto...
macros:
    %macro input 0
        call getKey
        call validateKey

    %endmacro

    %macro menuChoices 0
            call drawStartChoice
            call drawCreditsChoice
            call drawhighScoreChoice

    %endmacro

    %macro drawCredits 0
            call drawCredits
            call drawProjetoInfra
            call drawEnzo
            call drawLucas
            call drawMatheus

    %endmacro

    %macro endLoop 0
            call drawScore
            call insertName
            call isBetterScore

    %endmacro

    %macro renderLoop 0
            call applyColorLoop
            call drawSpacing
            call drawFillBlockColor
            call drawRows
            call drawNumbers
    %endmacro


main:
    screens:
        menu:
            menuChoices
            input
            call playerChoice
            loop menu

        credits:
            drawCredits
            input
            call isReturn
            loop credits

        game_over:
            call drawGameOver
            endLoop
            input
            call isReturn
            loop game_over

        highScore:
            call drawTopScores
            input
            call isReturn
            loop highscore

        winScreen:
            endLoop
            input
            call isReturn

    action:
        spawn:
            call isGameOver
            call getRandom
            call fillBlock

        move:
            input
            call moveBlocks
            call fillBlock

        match:
            call findAdjacents
            call directionMatch
            call unfillBlock
        renderLoop

    loop action


    aux:



jmp $
