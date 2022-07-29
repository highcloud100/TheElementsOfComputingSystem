// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(RESET)
	@temp
	M = 0

(IN)

	D = M[24576]

	@DEL //입력 없으면 del
	D;JEQ

	@temp
	D = M
	@8192 //넘어가면 멈춤
	D=D-A 
	@IN
	D;JEQ


(DRAW)

	@temp
	D = M //temp 값 불러옴

	@SCREEN
	A = A+D //screen + temp
	M = -1 // 색칠함

	@temp // 그려진 개수 카운트 변수
	M = M+1 // 카운트 증가

	@IN // IN으로 점프
	0;JMP


(DEL)
	
	@temp
	D = M

	@IN
	D;JLT // temp이 0이면 건너뀜

	
	@temp
	D = M

	@SCREEN
	A = A+D //screen + temp
	M = 0 // 지움

	@temp // 그려진 개수 카운트 변수
	M = M-1 // 카운트 증가

	@IN // IN으로 점프
	0;JMP