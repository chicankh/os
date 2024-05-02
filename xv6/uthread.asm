
_uthread:     file format elf32-i386


Disassembly of section .text:

00000000 <thread_init>:
static int num_thread = 0;

static void thread_schedule(void);

void thread_init(void (*func)())
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
  // main() is thread 0, which will make the first invocation to
  // thread_schedule().  it needs a stack so that the first thread_switch() can
  // save thread 0's state.  thread_schedule() won't run the main thread ever
  // again, because its state is set to RUNNING, and thread_schedule() selects
  // a RUNNABLE thread.
  current_thread = &all_thread[0];
   6:	c7 05 40 0e 00 00 60 	movl   $0xe60,0xe40
   d:	0e 00 00 
  current_thread->state = RUNNING;
  10:	a1 40 0e 00 00       	mov    0xe40,%eax
  15:	c7 80 04 20 00 00 01 	movl   $0x1,0x2004(%eax)
  1c:	00 00 00 
  num_thread = 0;
  1f:	c7 05 80 8e 00 00 00 	movl   $0x0,0x8e80
  26:	00 00 00 
  thread_num(num_thread);
  29:	a1 80 8e 00 00       	mov    0x8e80,%eax
  2e:	83 ec 0c             	sub    $0xc,%esp
  31:	50                   	push   %eax
  32:	e8 fe 05 00 00       	call   635 <thread_num>
  37:	83 c4 10             	add    $0x10,%esp
  uthread_init((uint)func);
  3a:	8b 45 08             	mov    0x8(%ebp),%eax
  3d:	83 ec 0c             	sub    $0xc,%esp
  40:	50                   	push   %eax
  41:	e8 e7 05 00 00       	call   62d <uthread_init>
  46:	83 c4 10             	add    $0x10,%esp
}
  49:	90                   	nop
  4a:	c9                   	leave  
  4b:	c3                   	ret    

0000004c <thread_schedule>:

static void
thread_schedule(void)
{
  4c:	55                   	push   %ebp
  4d:	89 e5                	mov    %esp,%ebp
  4f:	83 ec 18             	sub    $0x18,%esp
  if(current_thread->state != FREE && current_thread != &all_thread[0])
  52:	a1 40 0e 00 00       	mov    0xe40,%eax
  57:	8b 80 04 20 00 00    	mov    0x2004(%eax),%eax
  5d:	85 c0                	test   %eax,%eax
  5f:	74 1b                	je     7c <thread_schedule+0x30>
  61:	a1 40 0e 00 00       	mov    0xe40,%eax
  66:	3d 60 0e 00 00       	cmp    $0xe60,%eax
  6b:	74 0f                	je     7c <thread_schedule+0x30>
  {
    current_thread->state = RUNNABLE; 
  6d:	a1 40 0e 00 00       	mov    0xe40,%eax
  72:	c7 80 04 20 00 00 02 	movl   $0x2,0x2004(%eax)
  79:	00 00 00 
  }
  thread_p t;
  /* Find another runnable thread. */
  next_thread = 0;
  7c:	c7 05 44 0e 00 00 00 	movl   $0x0,0xe44
  83:	00 00 00 
  for (t = all_thread; t < all_thread + MAX_THREAD; t++)
  86:	c7 45 f4 60 0e 00 00 	movl   $0xe60,-0xc(%ebp)
  8d:	eb 29                	jmp    b8 <thread_schedule+0x6c>
  {
    if (t->state == RUNNABLE && t != current_thread)
  8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  92:	8b 80 04 20 00 00    	mov    0x2004(%eax),%eax
  98:	83 f8 02             	cmp    $0x2,%eax
  9b:	75 14                	jne    b1 <thread_schedule+0x65>
  9d:	a1 40 0e 00 00       	mov    0xe40,%eax
  a2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  a5:	74 0a                	je     b1 <thread_schedule+0x65>
    {
      next_thread = t;
  a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  aa:	a3 44 0e 00 00       	mov    %eax,0xe44
      break;
  af:	eb 11                	jmp    c2 <thread_schedule+0x76>
  for (t = all_thread; t < all_thread + MAX_THREAD; t++)
  b1:	81 45 f4 08 20 00 00 	addl   $0x2008,-0xc(%ebp)
  b8:	b8 80 8e 00 00       	mov    $0x8e80,%eax
  bd:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  c0:	72 cd                	jb     8f <thread_schedule+0x43>
    }
  }
  if (t >= all_thread + MAX_THREAD && current_thread->state == RUNNABLE)
  c2:	b8 80 8e 00 00       	mov    $0x8e80,%eax
  c7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  ca:	72 1a                	jb     e6 <thread_schedule+0x9a>
  cc:	a1 40 0e 00 00       	mov    0xe40,%eax
  d1:	8b 80 04 20 00 00    	mov    0x2004(%eax),%eax
  d7:	83 f8 02             	cmp    $0x2,%eax
  da:	75 0a                	jne    e6 <thread_schedule+0x9a>
  {
    /* The current thread is the only runnable thread; run it. */
    next_thread = current_thread;
  dc:	a1 40 0e 00 00       	mov    0xe40,%eax
  e1:	a3 44 0e 00 00       	mov    %eax,0xe44
  }
  if (next_thread == 0)
  e6:	a1 44 0e 00 00       	mov    0xe44,%eax
  eb:	85 c0                	test   %eax,%eax
  ed:	75 17                	jne    106 <thread_schedule+0xba>
  {
    printf(2, "thread_schedule: no runnable threads\n");
  ef:	83 ec 08             	sub    $0x8,%esp
  f2:	68 c8 0a 00 00       	push   $0xac8
  f7:	6a 02                	push   $0x2
  f9:	e8 13 06 00 00       	call   711 <printf>
  fe:	83 c4 10             	add    $0x10,%esp
    exit();
 101:	e8 87 04 00 00       	call   58d <exit>
  }
  if (current_thread != next_thread)
 106:	8b 15 40 0e 00 00    	mov    0xe40,%edx
 10c:	a1 44 0e 00 00       	mov    0xe44,%eax
 111:	39 c2                	cmp    %eax,%edx
 113:	74 16                	je     12b <thread_schedule+0xdf>
  { /* switch threads?  */
    next_thread->state = RUNNING;
 115:	a1 44 0e 00 00       	mov    0xe44,%eax
 11a:	c7 80 04 20 00 00 01 	movl   $0x1,0x2004(%eax)
 121:	00 00 00 
    thread_switch();
 124:	e8 ed 01 00 00       	call   316 <thread_switch>
  }
  
  else
    next_thread = 0;
}
 129:	eb 0a                	jmp    135 <thread_schedule+0xe9>
    next_thread = 0;
 12b:	c7 05 44 0e 00 00 00 	movl   $0x0,0xe44
 132:	00 00 00 
}
 135:	90                   	nop
 136:	c9                   	leave  
 137:	c3                   	ret    

00000138 <thread_create>:

void thread_create(void (*func)())
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	83 ec 18             	sub    $0x18,%esp
  thread_p t;
  num_thread++;
 13e:	a1 80 8e 00 00       	mov    0x8e80,%eax
 143:	83 c0 01             	add    $0x1,%eax
 146:	a3 80 8e 00 00       	mov    %eax,0x8e80
  thread_num(num_thread);
 14b:	a1 80 8e 00 00       	mov    0x8e80,%eax
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	50                   	push   %eax
 154:	e8 dc 04 00 00       	call   635 <thread_num>
 159:	83 c4 10             	add    $0x10,%esp
  for (t = all_thread; t < all_thread + MAX_THREAD; t++)
 15c:	c7 45 f4 60 0e 00 00 	movl   $0xe60,-0xc(%ebp)
 163:	eb 14                	jmp    179 <thread_create+0x41>
  {
    if (t->state == FREE)
 165:	8b 45 f4             	mov    -0xc(%ebp),%eax
 168:	8b 80 04 20 00 00    	mov    0x2004(%eax),%eax
 16e:	85 c0                	test   %eax,%eax
 170:	74 13                	je     185 <thread_create+0x4d>
  for (t = all_thread; t < all_thread + MAX_THREAD; t++)
 172:	81 45 f4 08 20 00 00 	addl   $0x2008,-0xc(%ebp)
 179:	b8 80 8e 00 00       	mov    $0x8e80,%eax
 17e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 181:	72 e2                	jb     165 <thread_create+0x2d>
 183:	eb 01                	jmp    186 <thread_create+0x4e>
      break;
 185:	90                   	nop
  }
  t->sp = (int)(t->stack + STACK_SIZE); // set sp to the top of the stack
 186:	8b 45 f4             	mov    -0xc(%ebp),%eax
 189:	83 c0 04             	add    $0x4,%eax
 18c:	05 00 20 00 00       	add    $0x2000,%eax
 191:	89 c2                	mov    %eax,%edx
 193:	8b 45 f4             	mov    -0xc(%ebp),%eax
 196:	89 10                	mov    %edx,(%eax)
  t->sp -= 4;                           // space for return address
 198:	8b 45 f4             	mov    -0xc(%ebp),%eax
 19b:	8b 00                	mov    (%eax),%eax
 19d:	8d 50 fc             	lea    -0x4(%eax),%edx
 1a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a3:	89 10                	mov    %edx,(%eax)
  *(int *)(t->sp) = (int)func;          // push return address on stack
 1a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a8:	8b 00                	mov    (%eax),%eax
 1aa:	89 c2                	mov    %eax,%edx
 1ac:	8b 45 08             	mov    0x8(%ebp),%eax
 1af:	89 02                	mov    %eax,(%edx)
  t->sp -= 32;                          // space for registers that thread_switch expects
 1b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b4:	8b 00                	mov    (%eax),%eax
 1b6:	8d 50 e0             	lea    -0x20(%eax),%edx
 1b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1bc:	89 10                	mov    %edx,(%eax)
  t->state = RUNNABLE;
 1be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c1:	c7 80 04 20 00 00 02 	movl   $0x2,0x2004(%eax)
 1c8:	00 00 00 
  
}
 1cb:	90                   	nop
 1cc:	c9                   	leave  
 1cd:	c3                   	ret    

000001ce <thread_yield>:

void thread_yield(void)
{
 1ce:	55                   	push   %ebp
 1cf:	89 e5                	mov    %esp,%ebp
 1d1:	83 ec 08             	sub    $0x8,%esp
  current_thread->state = RUNNABLE;
 1d4:	a1 40 0e 00 00       	mov    0xe40,%eax
 1d9:	c7 80 04 20 00 00 02 	movl   $0x2,0x2004(%eax)
 1e0:	00 00 00 
  thread_schedule();
 1e3:	e8 64 fe ff ff       	call   4c <thread_schedule>
}
 1e8:	90                   	nop
 1e9:	c9                   	leave  
 1ea:	c3                   	ret    

000001eb <mythread>:

static void
mythread(void)
{
 1eb:	55                   	push   %ebp
 1ec:	89 e5                	mov    %esp,%ebp
 1ee:	83 ec 18             	sub    $0x18,%esp
  int i;
  printf(1, "my thread running\n");
 1f1:	83 ec 08             	sub    $0x8,%esp
 1f4:	68 ee 0a 00 00       	push   $0xaee
 1f9:	6a 01                	push   $0x1
 1fb:	e8 11 05 00 00       	call   711 <printf>
 200:	83 c4 10             	add    $0x10,%esp
  for (i = 0; i < 100; i++)
 203:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 20a:	eb 1c                	jmp    228 <mythread+0x3d>
  {
    printf(1, "%d my thread 0x%x\n", i, (int)current_thread);
 20c:	a1 40 0e 00 00       	mov    0xe40,%eax
 211:	50                   	push   %eax
 212:	ff 75 f4             	push   -0xc(%ebp)
 215:	68 01 0b 00 00       	push   $0xb01
 21a:	6a 01                	push   $0x1
 21c:	e8 f0 04 00 00       	call   711 <printf>
 221:	83 c4 10             	add    $0x10,%esp
  for (i = 0; i < 100; i++)
 224:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 228:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 22c:	7e de                	jle    20c <mythread+0x21>
    // thread_yield();
  }
  printf(1, "my thread: exit\n");
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	68 14 0b 00 00       	push   $0xb14
 236:	6a 01                	push   $0x1
 238:	e8 d4 04 00 00       	call   711 <printf>
 23d:	83 c4 10             	add    $0x10,%esp
  current_thread->state = FREE;
 240:	a1 40 0e 00 00       	mov    0xe40,%eax
 245:	c7 80 04 20 00 00 00 	movl   $0x0,0x2004(%eax)
 24c:	00 00 00 
  num_thread--;
 24f:	a1 80 8e 00 00       	mov    0x8e80,%eax
 254:	83 e8 01             	sub    $0x1,%eax
 257:	a3 80 8e 00 00       	mov    %eax,0x8e80
  thread_num(num_thread);
 25c:	a1 80 8e 00 00       	mov    0x8e80,%eax
 261:	83 ec 0c             	sub    $0xc,%esp
 264:	50                   	push   %eax
 265:	e8 cb 03 00 00       	call   635 <thread_num>
 26a:	83 c4 10             	add    $0x10,%esp
  thread_schedule();
 26d:	e8 da fd ff ff       	call   4c <thread_schedule>
}
 272:	90                   	nop
 273:	c9                   	leave  
 274:	c3                   	ret    

00000275 <main>:

int main(int argc, char *argv[])
{
 275:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 279:	83 e4 f0             	and    $0xfffffff0,%esp
 27c:	ff 71 fc             	push   -0x4(%ecx)
 27f:	55                   	push   %ebp
 280:	89 e5                	mov    %esp,%ebp
 282:	51                   	push   %ecx
 283:	83 ec 04             	sub    $0x4,%esp
  printf(1, "addr : %d", (uint)thread_schedule);
 286:	b8 4c 00 00 00       	mov    $0x4c,%eax
 28b:	83 ec 04             	sub    $0x4,%esp
 28e:	50                   	push   %eax
 28f:	68 25 0b 00 00       	push   $0xb25
 294:	6a 01                	push   $0x1
 296:	e8 76 04 00 00       	call   711 <printf>
 29b:	83 c4 10             	add    $0x10,%esp
  thread_init(thread_schedule);
 29e:	83 ec 0c             	sub    $0xc,%esp
 2a1:	68 4c 00 00 00       	push   $0x4c
 2a6:	e8 55 fd ff ff       	call   0 <thread_init>
 2ab:	83 c4 10             	add    $0x10,%esp
  thread_create(mythread);
 2ae:	83 ec 0c             	sub    $0xc,%esp
 2b1:	68 eb 01 00 00       	push   $0x1eb
 2b6:	e8 7d fe ff ff       	call   138 <thread_create>
 2bb:	83 c4 10             	add    $0x10,%esp
  printf(1, "a\n");
 2be:	83 ec 08             	sub    $0x8,%esp
 2c1:	68 2f 0b 00 00       	push   $0xb2f
 2c6:	6a 01                	push   $0x1
 2c8:	e8 44 04 00 00       	call   711 <printf>
 2cd:	83 c4 10             	add    $0x10,%esp
  thread_create(mythread);
 2d0:	83 ec 0c             	sub    $0xc,%esp
 2d3:	68 eb 01 00 00       	push   $0x1eb
 2d8:	e8 5b fe ff ff       	call   138 <thread_create>
 2dd:	83 c4 10             	add    $0x10,%esp
  printf(1, "b\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 32 0b 00 00       	push   $0xb32
 2e8:	6a 01                	push   $0x1
 2ea:	e8 22 04 00 00       	call   711 <printf>
 2ef:	83 c4 10             	add    $0x10,%esp
  thread_schedule();
 2f2:	e8 55 fd ff ff       	call   4c <thread_schedule>
  printf(1, "c\n");
 2f7:	83 ec 08             	sub    $0x8,%esp
 2fa:	68 35 0b 00 00       	push   $0xb35
 2ff:	6a 01                	push   $0x1
 301:	e8 0b 04 00 00       	call   711 <printf>
 306:	83 c4 10             	add    $0x10,%esp
  return 0;
 309:	b8 00 00 00 00       	mov    $0x0,%eax
}
 30e:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 311:	c9                   	leave  
 312:	8d 61 fc             	lea    -0x4(%ecx),%esp
 315:	c3                   	ret    

00000316 <thread_switch>:
 316:	60                   	pusha  
 317:	a1 40 0e 00 00       	mov    0xe40,%eax
 31c:	89 20                	mov    %esp,(%eax)
 31e:	a1 44 0e 00 00       	mov    0xe44,%eax
 323:	8b 20                	mov    (%eax),%esp
 325:	a3 40 0e 00 00       	mov    %eax,0xe40
 32a:	61                   	popa   
 32b:	c7 05 44 0e 00 00 00 	movl   $0x0,0xe44
 332:	00 00 00 
 335:	c3                   	ret    

00000336 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	57                   	push   %edi
 33a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 33b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 33e:	8b 55 10             	mov    0x10(%ebp),%edx
 341:	8b 45 0c             	mov    0xc(%ebp),%eax
 344:	89 cb                	mov    %ecx,%ebx
 346:	89 df                	mov    %ebx,%edi
 348:	89 d1                	mov    %edx,%ecx
 34a:	fc                   	cld    
 34b:	f3 aa                	rep stos %al,%es:(%edi)
 34d:	89 ca                	mov    %ecx,%edx
 34f:	89 fb                	mov    %edi,%ebx
 351:	89 5d 08             	mov    %ebx,0x8(%ebp)
 354:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 357:	90                   	nop
 358:	5b                   	pop    %ebx
 359:	5f                   	pop    %edi
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    

0000035c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 362:	8b 45 08             	mov    0x8(%ebp),%eax
 365:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 368:	90                   	nop
 369:	8b 55 0c             	mov    0xc(%ebp),%edx
 36c:	8d 42 01             	lea    0x1(%edx),%eax
 36f:	89 45 0c             	mov    %eax,0xc(%ebp)
 372:	8b 45 08             	mov    0x8(%ebp),%eax
 375:	8d 48 01             	lea    0x1(%eax),%ecx
 378:	89 4d 08             	mov    %ecx,0x8(%ebp)
 37b:	0f b6 12             	movzbl (%edx),%edx
 37e:	88 10                	mov    %dl,(%eax)
 380:	0f b6 00             	movzbl (%eax),%eax
 383:	84 c0                	test   %al,%al
 385:	75 e2                	jne    369 <strcpy+0xd>
    ;
  return os;
 387:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 38a:	c9                   	leave  
 38b:	c3                   	ret    

0000038c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 38c:	55                   	push   %ebp
 38d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 38f:	eb 08                	jmp    399 <strcmp+0xd>
    p++, q++;
 391:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 395:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 399:	8b 45 08             	mov    0x8(%ebp),%eax
 39c:	0f b6 00             	movzbl (%eax),%eax
 39f:	84 c0                	test   %al,%al
 3a1:	74 10                	je     3b3 <strcmp+0x27>
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	0f b6 10             	movzbl (%eax),%edx
 3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ac:	0f b6 00             	movzbl (%eax),%eax
 3af:	38 c2                	cmp    %al,%dl
 3b1:	74 de                	je     391 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	0f b6 00             	movzbl (%eax),%eax
 3b9:	0f b6 d0             	movzbl %al,%edx
 3bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bf:	0f b6 00             	movzbl (%eax),%eax
 3c2:	0f b6 c8             	movzbl %al,%ecx
 3c5:	89 d0                	mov    %edx,%eax
 3c7:	29 c8                	sub    %ecx,%eax
}
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    

000003cb <strlen>:

uint
strlen(char *s)
{
 3cb:	55                   	push   %ebp
 3cc:	89 e5                	mov    %esp,%ebp
 3ce:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3d8:	eb 04                	jmp    3de <strlen+0x13>
 3da:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3de:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3e1:	8b 45 08             	mov    0x8(%ebp),%eax
 3e4:	01 d0                	add    %edx,%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	84 c0                	test   %al,%al
 3eb:	75 ed                	jne    3da <strlen+0xf>
    ;
  return n;
 3ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3f0:	c9                   	leave  
 3f1:	c3                   	ret    

000003f2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 3f5:	8b 45 10             	mov    0x10(%ebp),%eax
 3f8:	50                   	push   %eax
 3f9:	ff 75 0c             	push   0xc(%ebp)
 3fc:	ff 75 08             	push   0x8(%ebp)
 3ff:	e8 32 ff ff ff       	call   336 <stosb>
 404:	83 c4 0c             	add    $0xc,%esp
  return dst;
 407:	8b 45 08             	mov    0x8(%ebp),%eax
}
 40a:	c9                   	leave  
 40b:	c3                   	ret    

0000040c <strchr>:

char*
strchr(const char *s, char c)
{
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	83 ec 04             	sub    $0x4,%esp
 412:	8b 45 0c             	mov    0xc(%ebp),%eax
 415:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 418:	eb 14                	jmp    42e <strchr+0x22>
    if(*s == c)
 41a:	8b 45 08             	mov    0x8(%ebp),%eax
 41d:	0f b6 00             	movzbl (%eax),%eax
 420:	38 45 fc             	cmp    %al,-0x4(%ebp)
 423:	75 05                	jne    42a <strchr+0x1e>
      return (char*)s;
 425:	8b 45 08             	mov    0x8(%ebp),%eax
 428:	eb 13                	jmp    43d <strchr+0x31>
  for(; *s; s++)
 42a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 42e:	8b 45 08             	mov    0x8(%ebp),%eax
 431:	0f b6 00             	movzbl (%eax),%eax
 434:	84 c0                	test   %al,%al
 436:	75 e2                	jne    41a <strchr+0xe>
  return 0;
 438:	b8 00 00 00 00       	mov    $0x0,%eax
}
 43d:	c9                   	leave  
 43e:	c3                   	ret    

0000043f <gets>:

char*
gets(char *buf, int max)
{
 43f:	55                   	push   %ebp
 440:	89 e5                	mov    %esp,%ebp
 442:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 445:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 44c:	eb 42                	jmp    490 <gets+0x51>
    cc = read(0, &c, 1);
 44e:	83 ec 04             	sub    $0x4,%esp
 451:	6a 01                	push   $0x1
 453:	8d 45 ef             	lea    -0x11(%ebp),%eax
 456:	50                   	push   %eax
 457:	6a 00                	push   $0x0
 459:	e8 47 01 00 00       	call   5a5 <read>
 45e:	83 c4 10             	add    $0x10,%esp
 461:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 464:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 468:	7e 33                	jle    49d <gets+0x5e>
      break;
    buf[i++] = c;
 46a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 46d:	8d 50 01             	lea    0x1(%eax),%edx
 470:	89 55 f4             	mov    %edx,-0xc(%ebp)
 473:	89 c2                	mov    %eax,%edx
 475:	8b 45 08             	mov    0x8(%ebp),%eax
 478:	01 c2                	add    %eax,%edx
 47a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 47e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 480:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 484:	3c 0a                	cmp    $0xa,%al
 486:	74 16                	je     49e <gets+0x5f>
 488:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 48c:	3c 0d                	cmp    $0xd,%al
 48e:	74 0e                	je     49e <gets+0x5f>
  for(i=0; i+1 < max; ){
 490:	8b 45 f4             	mov    -0xc(%ebp),%eax
 493:	83 c0 01             	add    $0x1,%eax
 496:	39 45 0c             	cmp    %eax,0xc(%ebp)
 499:	7f b3                	jg     44e <gets+0xf>
 49b:	eb 01                	jmp    49e <gets+0x5f>
      break;
 49d:	90                   	nop
      break;
  }
  buf[i] = '\0';
 49e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4a1:	8b 45 08             	mov    0x8(%ebp),%eax
 4a4:	01 d0                	add    %edx,%eax
 4a6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4a9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4ac:	c9                   	leave  
 4ad:	c3                   	ret    

000004ae <stat>:

int
stat(char *n, struct stat *st)
{
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b4:	83 ec 08             	sub    $0x8,%esp
 4b7:	6a 00                	push   $0x0
 4b9:	ff 75 08             	push   0x8(%ebp)
 4bc:	e8 0c 01 00 00       	call   5cd <open>
 4c1:	83 c4 10             	add    $0x10,%esp
 4c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4cb:	79 07                	jns    4d4 <stat+0x26>
    return -1;
 4cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4d2:	eb 25                	jmp    4f9 <stat+0x4b>
  r = fstat(fd, st);
 4d4:	83 ec 08             	sub    $0x8,%esp
 4d7:	ff 75 0c             	push   0xc(%ebp)
 4da:	ff 75 f4             	push   -0xc(%ebp)
 4dd:	e8 03 01 00 00       	call   5e5 <fstat>
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4e8:	83 ec 0c             	sub    $0xc,%esp
 4eb:	ff 75 f4             	push   -0xc(%ebp)
 4ee:	e8 c2 00 00 00       	call   5b5 <close>
 4f3:	83 c4 10             	add    $0x10,%esp
  return r;
 4f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4f9:	c9                   	leave  
 4fa:	c3                   	ret    

000004fb <atoi>:

int
atoi(const char *s)
{
 4fb:	55                   	push   %ebp
 4fc:	89 e5                	mov    %esp,%ebp
 4fe:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 501:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 508:	eb 25                	jmp    52f <atoi+0x34>
    n = n*10 + *s++ - '0';
 50a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 50d:	89 d0                	mov    %edx,%eax
 50f:	c1 e0 02             	shl    $0x2,%eax
 512:	01 d0                	add    %edx,%eax
 514:	01 c0                	add    %eax,%eax
 516:	89 c1                	mov    %eax,%ecx
 518:	8b 45 08             	mov    0x8(%ebp),%eax
 51b:	8d 50 01             	lea    0x1(%eax),%edx
 51e:	89 55 08             	mov    %edx,0x8(%ebp)
 521:	0f b6 00             	movzbl (%eax),%eax
 524:	0f be c0             	movsbl %al,%eax
 527:	01 c8                	add    %ecx,%eax
 529:	83 e8 30             	sub    $0x30,%eax
 52c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 52f:	8b 45 08             	mov    0x8(%ebp),%eax
 532:	0f b6 00             	movzbl (%eax),%eax
 535:	3c 2f                	cmp    $0x2f,%al
 537:	7e 0a                	jle    543 <atoi+0x48>
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	0f b6 00             	movzbl (%eax),%eax
 53f:	3c 39                	cmp    $0x39,%al
 541:	7e c7                	jle    50a <atoi+0xf>
  return n;
 543:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 546:	c9                   	leave  
 547:	c3                   	ret    

00000548 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 548:	55                   	push   %ebp
 549:	89 e5                	mov    %esp,%ebp
 54b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 554:	8b 45 0c             	mov    0xc(%ebp),%eax
 557:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 55a:	eb 17                	jmp    573 <memmove+0x2b>
    *dst++ = *src++;
 55c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 55f:	8d 42 01             	lea    0x1(%edx),%eax
 562:	89 45 f8             	mov    %eax,-0x8(%ebp)
 565:	8b 45 fc             	mov    -0x4(%ebp),%eax
 568:	8d 48 01             	lea    0x1(%eax),%ecx
 56b:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 56e:	0f b6 12             	movzbl (%edx),%edx
 571:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 573:	8b 45 10             	mov    0x10(%ebp),%eax
 576:	8d 50 ff             	lea    -0x1(%eax),%edx
 579:	89 55 10             	mov    %edx,0x10(%ebp)
 57c:	85 c0                	test   %eax,%eax
 57e:	7f dc                	jg     55c <memmove+0x14>
  return vdst;
 580:	8b 45 08             	mov    0x8(%ebp),%eax
}
 583:	c9                   	leave  
 584:	c3                   	ret    

00000585 <fork>:
 585:	b8 01 00 00 00       	mov    $0x1,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <exit>:
 58d:	b8 02 00 00 00       	mov    $0x2,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <wait>:
 595:	b8 03 00 00 00       	mov    $0x3,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <pipe>:
 59d:	b8 04 00 00 00       	mov    $0x4,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <read>:
 5a5:	b8 05 00 00 00       	mov    $0x5,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <write>:
 5ad:	b8 10 00 00 00       	mov    $0x10,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <close>:
 5b5:	b8 15 00 00 00       	mov    $0x15,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <kill>:
 5bd:	b8 06 00 00 00       	mov    $0x6,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <exec>:
 5c5:	b8 07 00 00 00       	mov    $0x7,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <open>:
 5cd:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <mknod>:
 5d5:	b8 11 00 00 00       	mov    $0x11,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <unlink>:
 5dd:	b8 12 00 00 00       	mov    $0x12,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <fstat>:
 5e5:	b8 08 00 00 00       	mov    $0x8,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <link>:
 5ed:	b8 13 00 00 00       	mov    $0x13,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <mkdir>:
 5f5:	b8 14 00 00 00       	mov    $0x14,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <chdir>:
 5fd:	b8 09 00 00 00       	mov    $0x9,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <dup>:
 605:	b8 0a 00 00 00       	mov    $0xa,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <getpid>:
 60d:	b8 0b 00 00 00       	mov    $0xb,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <sbrk>:
 615:	b8 0c 00 00 00       	mov    $0xc,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <sleep>:
 61d:	b8 0d 00 00 00       	mov    $0xd,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <uptime>:
 625:	b8 0e 00 00 00       	mov    $0xe,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <uthread_init>:
 62d:	b8 16 00 00 00       	mov    $0x16,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <thread_num>:
 635:	b8 17 00 00 00       	mov    $0x17,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <putc>:
 63d:	55                   	push   %ebp
 63e:	89 e5                	mov    %esp,%ebp
 640:	83 ec 18             	sub    $0x18,%esp
 643:	8b 45 0c             	mov    0xc(%ebp),%eax
 646:	88 45 f4             	mov    %al,-0xc(%ebp)
 649:	83 ec 04             	sub    $0x4,%esp
 64c:	6a 01                	push   $0x1
 64e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 651:	50                   	push   %eax
 652:	ff 75 08             	push   0x8(%ebp)
 655:	e8 53 ff ff ff       	call   5ad <write>
 65a:	83 c4 10             	add    $0x10,%esp
 65d:	90                   	nop
 65e:	c9                   	leave  
 65f:	c3                   	ret    

00000660 <printint>:
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	83 ec 28             	sub    $0x28,%esp
 666:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 66d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 671:	74 17                	je     68a <printint+0x2a>
 673:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 677:	79 11                	jns    68a <printint+0x2a>
 679:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 680:	8b 45 0c             	mov    0xc(%ebp),%eax
 683:	f7 d8                	neg    %eax
 685:	89 45 ec             	mov    %eax,-0x14(%ebp)
 688:	eb 06                	jmp    690 <printint+0x30>
 68a:	8b 45 0c             	mov    0xc(%ebp),%eax
 68d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 690:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 697:	8b 4d 10             	mov    0x10(%ebp),%ecx
 69a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 69d:	ba 00 00 00 00       	mov    $0x0,%edx
 6a2:	f7 f1                	div    %ecx
 6a4:	89 d1                	mov    %edx,%ecx
 6a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a9:	8d 50 01             	lea    0x1(%eax),%edx
 6ac:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6af:	0f b6 91 2c 0e 00 00 	movzbl 0xe2c(%ecx),%edx
 6b6:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
 6ba:	8b 4d 10             	mov    0x10(%ebp),%ecx
 6bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6c0:	ba 00 00 00 00       	mov    $0x0,%edx
 6c5:	f7 f1                	div    %ecx
 6c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6ca:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6ce:	75 c7                	jne    697 <printint+0x37>
 6d0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6d4:	74 2d                	je     703 <printint+0xa3>
 6d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d9:	8d 50 01             	lea    0x1(%eax),%edx
 6dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6df:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 6e4:	eb 1d                	jmp    703 <printint+0xa3>
 6e6:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ec:	01 d0                	add    %edx,%eax
 6ee:	0f b6 00             	movzbl (%eax),%eax
 6f1:	0f be c0             	movsbl %al,%eax
 6f4:	83 ec 08             	sub    $0x8,%esp
 6f7:	50                   	push   %eax
 6f8:	ff 75 08             	push   0x8(%ebp)
 6fb:	e8 3d ff ff ff       	call   63d <putc>
 700:	83 c4 10             	add    $0x10,%esp
 703:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 707:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 70b:	79 d9                	jns    6e6 <printint+0x86>
 70d:	90                   	nop
 70e:	90                   	nop
 70f:	c9                   	leave  
 710:	c3                   	ret    

00000711 <printf>:
 711:	55                   	push   %ebp
 712:	89 e5                	mov    %esp,%ebp
 714:	83 ec 28             	sub    $0x28,%esp
 717:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 71e:	8d 45 0c             	lea    0xc(%ebp),%eax
 721:	83 c0 04             	add    $0x4,%eax
 724:	89 45 e8             	mov    %eax,-0x18(%ebp)
 727:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 72e:	e9 59 01 00 00       	jmp    88c <printf+0x17b>
 733:	8b 55 0c             	mov    0xc(%ebp),%edx
 736:	8b 45 f0             	mov    -0x10(%ebp),%eax
 739:	01 d0                	add    %edx,%eax
 73b:	0f b6 00             	movzbl (%eax),%eax
 73e:	0f be c0             	movsbl %al,%eax
 741:	25 ff 00 00 00       	and    $0xff,%eax
 746:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 749:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 74d:	75 2c                	jne    77b <printf+0x6a>
 74f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 753:	75 0c                	jne    761 <printf+0x50>
 755:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 75c:	e9 27 01 00 00       	jmp    888 <printf+0x177>
 761:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 764:	0f be c0             	movsbl %al,%eax
 767:	83 ec 08             	sub    $0x8,%esp
 76a:	50                   	push   %eax
 76b:	ff 75 08             	push   0x8(%ebp)
 76e:	e8 ca fe ff ff       	call   63d <putc>
 773:	83 c4 10             	add    $0x10,%esp
 776:	e9 0d 01 00 00       	jmp    888 <printf+0x177>
 77b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 77f:	0f 85 03 01 00 00    	jne    888 <printf+0x177>
 785:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 789:	75 1e                	jne    7a9 <printf+0x98>
 78b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 78e:	8b 00                	mov    (%eax),%eax
 790:	6a 01                	push   $0x1
 792:	6a 0a                	push   $0xa
 794:	50                   	push   %eax
 795:	ff 75 08             	push   0x8(%ebp)
 798:	e8 c3 fe ff ff       	call   660 <printint>
 79d:	83 c4 10             	add    $0x10,%esp
 7a0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7a4:	e9 d8 00 00 00       	jmp    881 <printf+0x170>
 7a9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7ad:	74 06                	je     7b5 <printf+0xa4>
 7af:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7b3:	75 1e                	jne    7d3 <printf+0xc2>
 7b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b8:	8b 00                	mov    (%eax),%eax
 7ba:	6a 00                	push   $0x0
 7bc:	6a 10                	push   $0x10
 7be:	50                   	push   %eax
 7bf:	ff 75 08             	push   0x8(%ebp)
 7c2:	e8 99 fe ff ff       	call   660 <printint>
 7c7:	83 c4 10             	add    $0x10,%esp
 7ca:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7ce:	e9 ae 00 00 00       	jmp    881 <printf+0x170>
 7d3:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7d7:	75 43                	jne    81c <printf+0x10b>
 7d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7dc:	8b 00                	mov    (%eax),%eax
 7de:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7e1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7e5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7e9:	75 25                	jne    810 <printf+0xff>
 7eb:	c7 45 f4 38 0b 00 00 	movl   $0xb38,-0xc(%ebp)
 7f2:	eb 1c                	jmp    810 <printf+0xff>
 7f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f7:	0f b6 00             	movzbl (%eax),%eax
 7fa:	0f be c0             	movsbl %al,%eax
 7fd:	83 ec 08             	sub    $0x8,%esp
 800:	50                   	push   %eax
 801:	ff 75 08             	push   0x8(%ebp)
 804:	e8 34 fe ff ff       	call   63d <putc>
 809:	83 c4 10             	add    $0x10,%esp
 80c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 810:	8b 45 f4             	mov    -0xc(%ebp),%eax
 813:	0f b6 00             	movzbl (%eax),%eax
 816:	84 c0                	test   %al,%al
 818:	75 da                	jne    7f4 <printf+0xe3>
 81a:	eb 65                	jmp    881 <printf+0x170>
 81c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 820:	75 1d                	jne    83f <printf+0x12e>
 822:	8b 45 e8             	mov    -0x18(%ebp),%eax
 825:	8b 00                	mov    (%eax),%eax
 827:	0f be c0             	movsbl %al,%eax
 82a:	83 ec 08             	sub    $0x8,%esp
 82d:	50                   	push   %eax
 82e:	ff 75 08             	push   0x8(%ebp)
 831:	e8 07 fe ff ff       	call   63d <putc>
 836:	83 c4 10             	add    $0x10,%esp
 839:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 83d:	eb 42                	jmp    881 <printf+0x170>
 83f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 843:	75 17                	jne    85c <printf+0x14b>
 845:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 848:	0f be c0             	movsbl %al,%eax
 84b:	83 ec 08             	sub    $0x8,%esp
 84e:	50                   	push   %eax
 84f:	ff 75 08             	push   0x8(%ebp)
 852:	e8 e6 fd ff ff       	call   63d <putc>
 857:	83 c4 10             	add    $0x10,%esp
 85a:	eb 25                	jmp    881 <printf+0x170>
 85c:	83 ec 08             	sub    $0x8,%esp
 85f:	6a 25                	push   $0x25
 861:	ff 75 08             	push   0x8(%ebp)
 864:	e8 d4 fd ff ff       	call   63d <putc>
 869:	83 c4 10             	add    $0x10,%esp
 86c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 86f:	0f be c0             	movsbl %al,%eax
 872:	83 ec 08             	sub    $0x8,%esp
 875:	50                   	push   %eax
 876:	ff 75 08             	push   0x8(%ebp)
 879:	e8 bf fd ff ff       	call   63d <putc>
 87e:	83 c4 10             	add    $0x10,%esp
 881:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 888:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 88c:	8b 55 0c             	mov    0xc(%ebp),%edx
 88f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 892:	01 d0                	add    %edx,%eax
 894:	0f b6 00             	movzbl (%eax),%eax
 897:	84 c0                	test   %al,%al
 899:	0f 85 94 fe ff ff    	jne    733 <printf+0x22>
 89f:	90                   	nop
 8a0:	90                   	nop
 8a1:	c9                   	leave  
 8a2:	c3                   	ret    

000008a3 <free>:
 8a3:	55                   	push   %ebp
 8a4:	89 e5                	mov    %esp,%ebp
 8a6:	83 ec 10             	sub    $0x10,%esp
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ac:	83 e8 08             	sub    $0x8,%eax
 8af:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8b2:	a1 8c 8e 00 00       	mov    0x8e8c,%eax
 8b7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8ba:	eb 24                	jmp    8e0 <free+0x3d>
 8bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bf:	8b 00                	mov    (%eax),%eax
 8c1:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 8c4:	72 12                	jb     8d8 <free+0x35>
 8c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8cc:	77 24                	ja     8f2 <free+0x4f>
 8ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d1:	8b 00                	mov    (%eax),%eax
 8d3:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 8d6:	72 1a                	jb     8f2 <free+0x4f>
 8d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8db:	8b 00                	mov    (%eax),%eax
 8dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8e6:	76 d4                	jbe    8bc <free+0x19>
 8e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8eb:	8b 00                	mov    (%eax),%eax
 8ed:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 8f0:	73 ca                	jae    8bc <free+0x19>
 8f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f5:	8b 40 04             	mov    0x4(%eax),%eax
 8f8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 902:	01 c2                	add    %eax,%edx
 904:	8b 45 fc             	mov    -0x4(%ebp),%eax
 907:	8b 00                	mov    (%eax),%eax
 909:	39 c2                	cmp    %eax,%edx
 90b:	75 24                	jne    931 <free+0x8e>
 90d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 910:	8b 50 04             	mov    0x4(%eax),%edx
 913:	8b 45 fc             	mov    -0x4(%ebp),%eax
 916:	8b 00                	mov    (%eax),%eax
 918:	8b 40 04             	mov    0x4(%eax),%eax
 91b:	01 c2                	add    %eax,%edx
 91d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 920:	89 50 04             	mov    %edx,0x4(%eax)
 923:	8b 45 fc             	mov    -0x4(%ebp),%eax
 926:	8b 00                	mov    (%eax),%eax
 928:	8b 10                	mov    (%eax),%edx
 92a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 92d:	89 10                	mov    %edx,(%eax)
 92f:	eb 0a                	jmp    93b <free+0x98>
 931:	8b 45 fc             	mov    -0x4(%ebp),%eax
 934:	8b 10                	mov    (%eax),%edx
 936:	8b 45 f8             	mov    -0x8(%ebp),%eax
 939:	89 10                	mov    %edx,(%eax)
 93b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93e:	8b 40 04             	mov    0x4(%eax),%eax
 941:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 948:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94b:	01 d0                	add    %edx,%eax
 94d:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 950:	75 20                	jne    972 <free+0xcf>
 952:	8b 45 fc             	mov    -0x4(%ebp),%eax
 955:	8b 50 04             	mov    0x4(%eax),%edx
 958:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95b:	8b 40 04             	mov    0x4(%eax),%eax
 95e:	01 c2                	add    %eax,%edx
 960:	8b 45 fc             	mov    -0x4(%ebp),%eax
 963:	89 50 04             	mov    %edx,0x4(%eax)
 966:	8b 45 f8             	mov    -0x8(%ebp),%eax
 969:	8b 10                	mov    (%eax),%edx
 96b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96e:	89 10                	mov    %edx,(%eax)
 970:	eb 08                	jmp    97a <free+0xd7>
 972:	8b 45 fc             	mov    -0x4(%ebp),%eax
 975:	8b 55 f8             	mov    -0x8(%ebp),%edx
 978:	89 10                	mov    %edx,(%eax)
 97a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97d:	a3 8c 8e 00 00       	mov    %eax,0x8e8c
 982:	90                   	nop
 983:	c9                   	leave  
 984:	c3                   	ret    

00000985 <morecore>:
 985:	55                   	push   %ebp
 986:	89 e5                	mov    %esp,%ebp
 988:	83 ec 18             	sub    $0x18,%esp
 98b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 992:	77 07                	ja     99b <morecore+0x16>
 994:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
 99b:	8b 45 08             	mov    0x8(%ebp),%eax
 99e:	c1 e0 03             	shl    $0x3,%eax
 9a1:	83 ec 0c             	sub    $0xc,%esp
 9a4:	50                   	push   %eax
 9a5:	e8 6b fc ff ff       	call   615 <sbrk>
 9aa:	83 c4 10             	add    $0x10,%esp
 9ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9b0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9b4:	75 07                	jne    9bd <morecore+0x38>
 9b6:	b8 00 00 00 00       	mov    $0x0,%eax
 9bb:	eb 26                	jmp    9e3 <morecore+0x5e>
 9bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c6:	8b 55 08             	mov    0x8(%ebp),%edx
 9c9:	89 50 04             	mov    %edx,0x4(%eax)
 9cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9cf:	83 c0 08             	add    $0x8,%eax
 9d2:	83 ec 0c             	sub    $0xc,%esp
 9d5:	50                   	push   %eax
 9d6:	e8 c8 fe ff ff       	call   8a3 <free>
 9db:	83 c4 10             	add    $0x10,%esp
 9de:	a1 8c 8e 00 00       	mov    0x8e8c,%eax
 9e3:	c9                   	leave  
 9e4:	c3                   	ret    

000009e5 <malloc>:
 9e5:	55                   	push   %ebp
 9e6:	89 e5                	mov    %esp,%ebp
 9e8:	83 ec 18             	sub    $0x18,%esp
 9eb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ee:	83 c0 07             	add    $0x7,%eax
 9f1:	c1 e8 03             	shr    $0x3,%eax
 9f4:	83 c0 01             	add    $0x1,%eax
 9f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 9fa:	a1 8c 8e 00 00       	mov    0x8e8c,%eax
 9ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a02:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a06:	75 23                	jne    a2b <malloc+0x46>
 a08:	c7 45 f0 84 8e 00 00 	movl   $0x8e84,-0x10(%ebp)
 a0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a12:	a3 8c 8e 00 00       	mov    %eax,0x8e8c
 a17:	a1 8c 8e 00 00       	mov    0x8e8c,%eax
 a1c:	a3 84 8e 00 00       	mov    %eax,0x8e84
 a21:	c7 05 88 8e 00 00 00 	movl   $0x0,0x8e88
 a28:	00 00 00 
 a2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a2e:	8b 00                	mov    (%eax),%eax
 a30:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a33:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a36:	8b 40 04             	mov    0x4(%eax),%eax
 a39:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 a3c:	77 4d                	ja     a8b <malloc+0xa6>
 a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a41:	8b 40 04             	mov    0x4(%eax),%eax
 a44:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 a47:	75 0c                	jne    a55 <malloc+0x70>
 a49:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4c:	8b 10                	mov    (%eax),%edx
 a4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a51:	89 10                	mov    %edx,(%eax)
 a53:	eb 26                	jmp    a7b <malloc+0x96>
 a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a58:	8b 40 04             	mov    0x4(%eax),%eax
 a5b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a5e:	89 c2                	mov    %eax,%edx
 a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a63:	89 50 04             	mov    %edx,0x4(%eax)
 a66:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a69:	8b 40 04             	mov    0x4(%eax),%eax
 a6c:	c1 e0 03             	shl    $0x3,%eax
 a6f:	01 45 f4             	add    %eax,-0xc(%ebp)
 a72:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a75:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a78:	89 50 04             	mov    %edx,0x4(%eax)
 a7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a7e:	a3 8c 8e 00 00       	mov    %eax,0x8e8c
 a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a86:	83 c0 08             	add    $0x8,%eax
 a89:	eb 3b                	jmp    ac6 <malloc+0xe1>
 a8b:	a1 8c 8e 00 00       	mov    0x8e8c,%eax
 a90:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a93:	75 1e                	jne    ab3 <malloc+0xce>
 a95:	83 ec 0c             	sub    $0xc,%esp
 a98:	ff 75 ec             	push   -0x14(%ebp)
 a9b:	e8 e5 fe ff ff       	call   985 <morecore>
 aa0:	83 c4 10             	add    $0x10,%esp
 aa3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 aa6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 aaa:	75 07                	jne    ab3 <malloc+0xce>
 aac:	b8 00 00 00 00       	mov    $0x0,%eax
 ab1:	eb 13                	jmp    ac6 <malloc+0xe1>
 ab3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ab9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 abc:	8b 00                	mov    (%eax),%eax
 abe:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ac1:	e9 6d ff ff ff       	jmp    a33 <malloc+0x4e>
 ac6:	c9                   	leave  
 ac7:	c3                   	ret    
