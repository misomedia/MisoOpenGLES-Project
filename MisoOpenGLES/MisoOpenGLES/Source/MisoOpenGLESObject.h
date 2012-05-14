//
//  MisoOpenGLESObject.h
//  MisoOpenGLES
//
//  Created by Ryan Tsukamoto on 5/11/12.
//  Copyright (c) 2012 Miso Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <OpenGLESTypes/OpenGLESTypes.h>
#import <Generics/Generics.h>

//!	A class for a recursively structured object with translation and scaling at each node in the tree.
@interface MisoOpenGLESObject : NSObject

@property	(nonatomic, readwrite)	GLfloat tx;	//!<	Translation in x direction.
@property	(nonatomic, readwrite)	GLfloat ty;	//!<	Translation in y direction.
@property	(nonatomic, readwrite)	GLfloat sx;	//!<	Scale factor in x direction.
@property	(nonatomic, readwrite)	GLfloat sy;	//!<	Scale factor in y direction.
@property	(nonatomic, readwrite, strong)	NSArray* subobjects;	//!<	An array of MisoOpenGLESObject instances.

+(MisoOpenGLESObject*)objectWithSubobjects:(NSArray*)subobjects;

+(MisoOpenGLESObject*)objectAtPoint:(CGPoint)point subobjects:(NSArray*)subobjects;

+(MisoOpenGLESObject*)objectAtPoint:(CGPoint)point xScaleFactor:(GLfloat)xScaleFactor yScaleFactor:(GLfloat)yScaleFactor subobjects:(NSArray*)subobjects;

-(id)initWithTx:(GLfloat)tx ty:(GLfloat)ty sx:(GLfloat)sx sy:(GLfloat)sy subobjects:(NSArray*)subobjects;

-(void)draw;	//DO NOT REIMPLEMENT THIS!  Use this to draw.

-(void)drawContent;	//REIMPLEMENT THIS!  Use this to define how it's drawn (translation and scaling is already done).

@end
