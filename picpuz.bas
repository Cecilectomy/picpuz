DECLARE SUB initialize ()
DECLARE SUB gameloop ()
DECLARE SUB resetboard ()
DECLARE SUB scrambleboard ()
DECLARE SUB drawboard ()
DECLARE SUB drawinterface ()
DECLARE SUB drawframe ()
DECLARE SUB trymove (inputkey$, x, y)

DIM SHARED map(3, 3)
DIM SHARED moves
DIM SHARED picture(5000)
DIM SHARED one(500)
DIM SHARED two(500)
DIM SHARED three(500)
DIM SHARED four(500)
DIM SHARED five(500)
DIM SHARED six(500)
DIM SHARED seven(500)
DIM SHARED eight(500)
DIM SHARED nine(500)
DIM SHARED empty(500)

RANDOMIZE TIMER
SCREEN 13

initialize
gameloop

SUB initialize
    DEF SEG = VARSEG(picture(0)): BLOAD "assets/gfx/picture.gfx", VARPTR(picture(0)): DEF SEG

    PUT (1, 1), picture(0), PSET

    GET (1, 1)-(30, 30), one(0)
    GET (31, 1)-(60, 30), two(0)
    GET (61, 1)-(90, 30), three(0)
    GET (1, 31)-(30, 60), four(0)
    GET (31, 31)-(60, 60), five(0)
    GET (61, 31)-(90, 60), six(0)
    GET (1, 61)-(30, 90), seven(0)
    GET (31, 61)-(60, 90), eight(0)
    GET (61, 61)-(90, 90), nine(0)

    CLS

    GET (91, 91)-(120, 120), empty(0)
END SUB

SUB gameloop
    resetloop:

    CLS

    moves = 0

    drawframe
    drawinterface
    resetboard
    scrambleboard

    DO UNTIL getkey$ = CHR$(27)
        getkey$ = INKEY$
        
        IF getkey$ = "r" THEN GOTO resetloop

        emptyX = 0
        emptyY = 0
        FOR y = 1 TO 3
            FOR x = 1 TO 3
                IF map(x, y) = 0 THEN
                    emptyX = x
                    emptyY = y
                END IF
            NEXT
        NEXT

        trymove getkey$, emptyX, emptyY
        drawinterface
        drawboard

        IF map(1, 1) = 1 AND map(2, 1) = 2 AND map(3, 1) = 3 AND map(1, 2) = 4 AND map(2, 2) = 5 AND map(3, 2) = 6 AND map(1, 3) = 7 AND map(2, 3) = 8 AND map(3, 3) = 0 THEN
            CLS
            
            drawframe
            drawinterface

            PUT (32, 52), picture(0), PSET

            DO UNTIL getkey$ = CHR$(27)
                getkey$ = INKEY$

                LOCATE 4, 22
                PRINT "[ Solved ]"

                IF getkey$ = "r" THEN GOTO resetloop
            LOOP
        END IF
    LOOP
END SUB

SUB resetboard
    a = 0
    FOR y = 1 TO 3
        FOR x = 1 TO 3
            map(x, y) = a
            a = a + 1
        NEXT
    NEXT
END SUB

SUB scrambleboard
    FOR z = 1 TO 200
        b% = INT((RND * 4) + 1)

        FOR y = 1 TO 3
            FOR x = 1 TO 3
                IF b% = 1 AND map(x, y) = 0 AND y < 3 THEN
                    b% = 0
                    map(x, y) = map(x, (y + 1))
                    map(x, (y + 1)) = 0
                END IF

                IF b% = 2 AND map(x, y) = 0 AND x < 3 THEN
                    b% = 0
                    map(x, y) = map((x + 1), y)
                    map((x + 1), y) = 0
                END IF

                IF b% = 3 AND map(x, y) = 0 AND y > 1 THEN
                    b% = 0
                    map(x, y) = map(x, (y - 1))
                    map(x, (y - 1)) = 0
                END IF

                IF b% = 4 AND map(x, y) = 0 AND x > 1 THEN
                    b% = 0
                    map(x, y) = map((x - 1), y)
                    map((x - 1), y) = 0
                END IF
            NEXT
        NEXT
    NEXT
END SUB

SUB drawboard
    FOR y = 1 TO 3
        FOR x = 1 TO 3
            IF map(x, y) = 0 THEN PUT ((x * 30) + x, (y * 30) + (y + 20)), empty(0), PSET
            IF map(x, y) = 1 THEN PUT ((x * 30) + x, (y * 30) + (y + 20)), one(0), PSET
            IF map(x, y) = 2 THEN PUT ((x * 30) + x, (y * 30) + (y + 20)), two(0), PSET
            IF map(x, y) = 3 THEN PUT ((x * 30) + x, (y * 30) + (y + 20)), three(0), PSET
            IF map(x, y) = 4 THEN PUT ((x * 30) + x, (y * 30) + (y + 20)), four(0), PSET
            IF map(x, y) = 5 THEN PUT ((x * 30) + x, (y * 30) + (y + 20)), five(0), PSET
            IF map(x, y) = 6 THEN PUT ((x * 30) + x, (y * 30) + (y + 20)), six(0), PSET
            IF map(x, y) = 7 THEN PUT ((x * 30) + x, (y * 30) + (y + 20)), seven(0), PSET
            IF map(x, y) = 8 THEN PUT ((x * 30) + x, (y * 30) + (y + 20)), eight(0), PSET
            IF map(x, y) = 9 THEN PUT ((x * 30) + x, (y * 30) + (y + 20)), nine(0), PSET
        NEXT
    NEXT
END SUB

SUB drawinterface
    LOCATE 2, 22
    PRINT "[ PicturePuzzler ]"

    LOCATE 3, 22
    PRINT "["; moves; "- moves ]"

    PUT (190, 51), picture(0), PSET

    LOCATE 22, 22
    PRINT "[ r - refresh ]"

    LOCATE 23, 22
    PRINT "[ Esc - escape]"
END SUB

SUB drawframe
    LINE (29, 49)-(124, 49)
    LINE (29, 144)-(124, 144)
    LINE (124, 49)-(124, 144)
    LINE (29, 49)-(29, 144)

    LINE (0, 0)-(319, 0)
    LINE (319, 0)-(319, 199)
    LINE (319, 199)-(0, 199)
    LINE (0, 199)-(0, 0)

    LINE (2, 2)-(158, 2)
    LINE (158, 2)-(158, 197)
    LINE (158, 197)-(2, 197)
    LINE (2, 197)-(2, 2)

    LINE (160, 2)-(317, 2)
    LINE (317, 2)-(317, 197)
    LINE (317, 197)-(160, 197)
    LINE (160, 197)-(160, 2)
END SUB

SUB trymove (inputkey$, x, y)
    IF inputkey$ = "w" AND y < 3 THEN
        map(x, y) = map(x, (y + 1))
        map(x, (y + 1)) = 0
    END IF

    IF inputkey$ = "a" AND map(x, y) = 0 AND x < 3 THEN
        map(x, y) = map((x + 1), y)
        map((x + 1), y) = 0
    END IF

    IF inputkey$ = "s" AND map(x, y) = 0 AND y > 1 THEN
        map(x, y) = map(x, (y - 1))
        map(x, (y - 1)) = 0
    END IF

    IF inputkey$ = "d" AND map(x, y) = 0 AND x > 1 THEN
        map(x, y) = map((x - 1), y)
        map((x - 1), y) = 0
    END IF

    IF map(x, y) <> 0 THEN moves = moves + 1
END SUB
