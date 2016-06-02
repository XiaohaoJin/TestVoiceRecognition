//
//  ViewController.m
//  MiaoMiaoVoice
//
//  Created by 金晓浩 on 16/6/1.
//  Copyright © 2016年 XiaoHaoJin. All rights reserved.
//

#import "ViewController.h"
#import "ISRDataHelper.h"

CGFloat const kHorizontalMargin = 10.f;
CGFloat const kVerticalMargin = 20.f;
@interface ViewController () <IFlyRecognizerViewDelegate>

@property (nonatomic, strong) UIButton *beginButton;
@property (nonatomic, strong) UITextView *contentTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.contentTextView];
    [self.view addSubview:self.beginButton];
    [self configIflyRecognizerView];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.beginButton.frame = CGRectMake(kHorizontalMargin , ScreenHeight - 30 - kHorizontalMargin, ScreenWidth - kHorizontalMargin*2, 30);
    self.contentTextView.frame = CGRectMake(kHorizontalMargin, kVerticalMargin, ScreenWidth - kHorizontalMargin*2, ScreenHeight - kVerticalMargin);
}

- (void)configIflyRecognizerView
{
    _iflyRecognizerView = [[IFlyRecognizerView alloc] initWithCenter:self.view.center];
    _iflyRecognizerView.delegate = self;
    [_iflyRecognizerView setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];
    // 保存录音文件名 如不再需要，设置value为nil表示取消，默认目录是documents
    [_iflyRecognizerView setParameter:@"asr.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    //设置听写结果格式为json
//    [_iflyRecognizerView setParameter:@"plain" forKey:[IFlySpeechConstant RESULT_TYPE]];

}

/*!
 *  回调返回识别结果
 *
 *  @param resultArray 识别结果，NSArray的第一个元素为NSDictionary，NSDictionary的key为识别结果，sc为识别结果的置信度
 *  @param isLast      -[out] 是否最后一个结果
 */
- (void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast {
    NSMutableString * result = [[NSMutableString alloc] init];
    NSDictionary * dic = [resultArray objectAtIndex:0];
    for (NSString *key in dic) {
        [result appendFormat:@"%@",key];
    }
    NSString *resu = [ISRDataHelper stringFromJson:result];
    if (kIsNull(resu)) {
        [JJAlertView showAlertWithTitle:@"提示" message:@"没有识别到内容" cancelButtonTitle:@"确认" otherButtonTitles:nil completion:nil];
    }
    _contentTextView.text = [_contentTextView.text stringByAppendingString:resu];
}

/*!
 *  识别结束回调
 *
 *  @param error 识别结束错误码
 */
- (void)onError: (IFlySpeechError *) error {
    NSLog(@"识别结束回调  == %@",error);
}

- (void)beginButtonAction {
    　//启动识别服务
    [_iflyRecognizerView start];

}

#pragma mark - lazy load
- (UIButton *)beginButton
{
    if (!_beginButton) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"Voice" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor grayColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(beginButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _beginButton = button;
    }
    return _beginButton;
}

- (UITextView *)contentTextView
{
    if (!_contentTextView) {
        
        _contentTextView = [UITextView new];
        [_contentTextView setScrollEnabled:YES];
        
    }
    return _contentTextView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
