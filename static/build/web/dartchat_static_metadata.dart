library dartchat.web.dartchat.generated_metadata;

import 'package:angular/core/registry.dart' show MetadataExtractor;
import 'package:di/di.dart' show Module;

import 'dartchat.dart' as import_0;
import 'package:di/annotations.dart' as import_1;
import 'package:angular/core/annotation_src.dart' as import_2;
import 'package:angular/core_dom/module_internal.dart' as import_3;
import 'package:angular/directive/module.dart' as import_4;
import 'package:angular/core/parser/parser.dart' as import_5;
import 'package:angular/core/formatter.dart' as import_6;
import 'package:angular/core/module_internal.dart' as import_7;
import 'package:angular/core/pending_async.dart' as import_8;
import 'package:angular/core/parser/lexer.dart' as import_9;
import 'package:angular/change_detection/ast_parser.dart' as import_10;
import 'package:angular/cache/module.dart' as import_11;
import 'package:angular/core_dom/resource_url_resolver.dart' as import_12;
import 'package:angular/formatter/module_internal.dart' as import_13;
import 'package:angular/animate/module.dart' as import_14;
import 'package:angular/routing/module.dart' as import_15;
import 'package:angular/cache/js_cache_register.dart' as import_16;
Module get metadataModule => new Module()
    ..bind(MetadataExtractor, toValue: new _StaticMetadataExtractor());

class _StaticMetadataExtractor implements MetadataExtractor {
  Iterable call(Type type) {
    var annotations = typeAnnotations[type];
    if (annotations != null) {
      return annotations;
    }
    return [];
  }
}

final Map<Type, Object> typeAnnotations = {
  import_0.$roomsService: const [
    const import_1.Injectable(),
  ],
  import_0.$joinedRoomsService: const [
    const import_1.Injectable(),
  ],
  import_0.User: const [
    const import_1.Injectable(),
  ],
  import_0.Room: const [
    const import_1.Injectable(),
  ],
  import_0.API: const [
    const import_1.Injectable(),
  ],
  import_0.LoginView: const [
    const import_2.Component(selector: 'login', templateUrl: 'login.html', cssUrl: import_0.CSS_URLs, useNgBaseCss: true, map: const {'user': '<=>user'}),
  ],
  import_0.AppView: const [
    const import_2.Component(selector: 'body', templateUrl: 'app.html', cssUrl: import_0.CSS_URLs, map: const {'user': '<=>user'}),
  ],
  import_0.Footer: const [
    const import_2.Component(selector: 'footer', templateUrl: 'footer.html', cssUrl: import_0.CSS_URLs, map: const {'user': '<=>user', 'room': '<=>room', 'message': '<=>message'}),
  ],
  import_0.Sidebar: const [
    const import_2.Component(selector: 'sidebar', templateUrl: 'sidebar.html', cssUrl: import_0.CSS_URLs, map: const {'roomsSrv': '<=>roomsSrv', 'user': '<=>user', 'jrs': '<=>jrs'}),
  ],
  import_0.Chat: const [
    const import_2.Component(selector: 'chat', templateUrl: 'chat.html', cssUrl: import_0.CSS_URLs, map: const {'room': '<=>room', 'roomname': '<=>roomname', 'roomsSrv': '<=>roomsSrv'}),
  ],
  import_0.ChatMessage: const [
    const import_2.Component(selector: 'chat-message', templateUrl: 'chat_message.html', cssUrl: import_0.CSS_URLs, map: const {'message': '<=>message'}),
  ],
  import_3.Animate: const [
    const import_1.Injectable(),
  ],
  import_3.BrowserCookies: const [
    const import_1.Injectable(),
  ],
  import_3.Cookies: const [
    const import_1.Injectable(),
  ],
  import_3.Compiler: const [
    const import_1.Injectable(),
  ],
  import_3.CompilerConfig: const [
    const import_1.Injectable(),
  ],
  import_3.DirectiveMap: const [
    const import_1.Injectable(),
  ],
  import_3.ElementBinderFactory: const [
    const import_1.Injectable(),
  ],
  import_3.EventHandler: const [
    const import_1.Injectable(),
  ],
  import_3.ShadowRootEventHandler: const [
    const import_1.Injectable(),
  ],
  import_3.DefaultShadowBoundary: const [
    const import_1.Injectable(),
  ],
  import_3.ShadowRootBoundary: const [
    const import_1.Injectable(),
  ],
  import_3.UrlRewriter: const [
    const import_1.Injectable(),
  ],
  import_3.HttpBackend: const [
    const import_1.Injectable(),
  ],
  import_3.LocationWrapper: const [
    const import_1.Injectable(),
  ],
  import_3.HttpInterceptors: const [
    const import_1.Injectable(),
  ],
  import_3.HttpDefaultHeaders: const [
    const import_1.Injectable(),
  ],
  import_3.HttpDefaults: const [
    const import_1.Injectable(),
  ],
  import_3.Http: const [
    const import_1.Injectable(),
  ],
  import_3.HttpConfig: const [
    const import_1.Injectable(),
  ],
  import_3.TextMustache: const [
    const import_2.Decorator(selector: r':contains(/{{.*}}/)'),
  ],
  import_3.AttrMustache: const [
    const import_2.Decorator(selector: r'[*=/{{.*}}/]'),
  ],
  import_3.NgElement: const [
    const import_1.Injectable(),
  ],
  import_3.DirectiveSelectorFactory: const [
    const import_1.Injectable(),
  ],
  import_3.ShadowDomComponentFactory: const [
    const import_1.Injectable(),
  ],
  import_3.ComponentCssRewriter: const [
    const import_1.Injectable(),
  ],
  import_3.TranscludingComponentFactory: const [
    const import_1.Injectable(),
  ],
  import_3.Content: const [
    const import_2.Decorator(selector: 'content', map: const {'select': '@select'}),
  ],
  import_3.NullTreeSanitizer: const [
    const import_1.Injectable(),
  ],
  import_3.ViewFactoryCache: const [
    const import_1.Injectable(),
  ],
  import_3.PlatformJsBasedShim: const [
    const import_1.Injectable(),
  ],
  import_3.DefaultPlatformShim: const [
    const import_1.Injectable(),
  ],
  import_4.AHref: const [
    const import_2.Decorator(selector: 'a[href]'),
  ],
  import_4.NgBaseCss: const [
    const import_2.Decorator(selector: '[ng-base-css]', visibility: import_2.Visibility.CHILDREN, map: const {'ng-base-css': '@urls'}),
  ],
  import_4.NgBind: const [
    const import_2.Decorator(selector: '[ng-bind]', map: const {'ng-bind': '=>value'}),
  ],
  import_4.NgBindHtml: const [
    const import_2.Decorator(selector: '[ng-bind-html]', map: const {'ng-bind-html': '=>value'}),
  ],
  import_4.NgBindTemplate: const [
    const import_2.Decorator(selector: '[ng-bind-template]', map: const {'ng-bind-template': '@bind'}),
  ],
  import_4.NgClass: const [
    const import_2.Decorator(selector: '[ng-class]', map: const {'ng-class': '@valueExpression'}, exportExpressionAttrs: const ['ng-class',]),
  ],
  import_4.NgClassOdd: const [
    const import_2.Decorator(selector: '[ng-class-odd]', map: const {'ng-class-odd': '@valueExpression'}, exportExpressionAttrs: const ['ng-class-odd',]),
  ],
  import_4.NgClassEven: const [
    const import_2.Decorator(selector: '[ng-class-even]', map: const {'ng-class-even': '@valueExpression'}, exportExpressionAttrs: const ['ng-class-even',]),
  ],
  import_4.NgEvent: const [
    const import_2.Decorator(selector: '[ng-abort]', map: const {'ng-abort': '&onAbort'}),
    const import_2.Decorator(selector: '[ng-beforecopy]', map: const {'ng-beforecopy': '&onBeforeCopy'}),
    const import_2.Decorator(selector: '[ng-beforecut]', map: const {'ng-beforecut': '&onBeforeCut'}),
    const import_2.Decorator(selector: '[ng-beforepaste]', map: const {'ng-beforepaste': '&onBeforePaste'}),
    const import_2.Decorator(selector: '[ng-blur]', map: const {'ng-blur': '&onBlur'}),
    const import_2.Decorator(selector: '[ng-change]', map: const {'ng-change': '&onChange'}),
    const import_2.Decorator(selector: '[ng-click]', map: const {'ng-click': '&onClick'}),
    const import_2.Decorator(selector: '[ng-contextmenu]', map: const {'ng-contextmenu': '&onContextMenu'}),
    const import_2.Decorator(selector: '[ng-copy]', map: const {'ng-copy': '&onCopy'}),
    const import_2.Decorator(selector: '[ng-cut]', map: const {'ng-cut': '&onCut'}),
    const import_2.Decorator(selector: '[ng-doubleclick]', map: const {'ng-doubleclick': '&onDoubleClick'}),
    const import_2.Decorator(selector: '[ng-drag]', map: const {'ng-drag': '&onDrag'}),
    const import_2.Decorator(selector: '[ng-dragend]', map: const {'ng-dragend': '&onDragEnd'}),
    const import_2.Decorator(selector: '[ng-dragenter]', map: const {'ng-dragenter': '&onDragEnter'}),
    const import_2.Decorator(selector: '[ng-dragleave]', map: const {'ng-dragleave': '&onDragLeave'}),
    const import_2.Decorator(selector: '[ng-dragover]', map: const {'ng-dragover': '&onDragOver'}),
    const import_2.Decorator(selector: '[ng-dragstart]', map: const {'ng-dragstart': '&onDragStart'}),
    const import_2.Decorator(selector: '[ng-drop]', map: const {'ng-drop': '&onDrop'}),
    const import_2.Decorator(selector: '[ng-error]', map: const {'ng-error': '&onError'}),
    const import_2.Decorator(selector: '[ng-focus]', map: const {'ng-focus': '&onFocus'}),
    const import_2.Decorator(selector: '[ng-fullscreenchange]', map: const {'ng-fullscreenchange': '&onFullscreenChange'}),
    const import_2.Decorator(selector: '[ng-fullscreenerror]', map: const {'ng-fullscreenerror': '&onFullscreenError'}),
    const import_2.Decorator(selector: '[ng-input]', map: const {'ng-input': '&onInput'}),
    const import_2.Decorator(selector: '[ng-invalid]', map: const {'ng-invalid': '&onInvalid'}),
    const import_2.Decorator(selector: '[ng-keydown]', map: const {'ng-keydown': '&onKeyDown'}),
    const import_2.Decorator(selector: '[ng-keypress]', map: const {'ng-keypress': '&onKeyPress'}),
    const import_2.Decorator(selector: '[ng-keyup]', map: const {'ng-keyup': '&onKeyUp'}),
    const import_2.Decorator(selector: '[ng-load]', map: const {'ng-load': '&onLoad'}),
    const import_2.Decorator(selector: '[ng-mousedown]', map: const {'ng-mousedown': '&onMouseDown'}),
    const import_2.Decorator(selector: '[ng-mouseenter]', map: const {'ng-mouseenter': '&onMouseEnter'}),
    const import_2.Decorator(selector: '[ng-mouseleave]', map: const {'ng-mouseleave': '&onMouseLeave'}),
    const import_2.Decorator(selector: '[ng-mousemove]', map: const {'ng-mousemove': '&onMouseMove'}),
    const import_2.Decorator(selector: '[ng-mouseout]', map: const {'ng-mouseout': '&onMouseOut'}),
    const import_2.Decorator(selector: '[ng-mouseover]', map: const {'ng-mouseover': '&onMouseOver'}),
    const import_2.Decorator(selector: '[ng-mouseup]', map: const {'ng-mouseup': '&onMouseUp'}),
    const import_2.Decorator(selector: '[ng-mousewheel]', map: const {'ng-mousewheel': '&onMouseWheel'}),
    const import_2.Decorator(selector: '[ng-paste]', map: const {'ng-paste': '&onPaste'}),
    const import_2.Decorator(selector: '[ng-reset]', map: const {'ng-reset': '&onReset'}),
    const import_2.Decorator(selector: '[ng-scroll]', map: const {'ng-scroll': '&onScroll'}),
    const import_2.Decorator(selector: '[ng-search]', map: const {'ng-search': '&onSearch'}),
    const import_2.Decorator(selector: '[ng-select]', map: const {'ng-select': '&onSelect'}),
    const import_2.Decorator(selector: '[ng-selectstart]', map: const {'ng-selectstart': '&onSelectStart'}),
    const import_2.Decorator(selector: '[ng-submit]', map: const {'ng-submit': '&onSubmit'}),
    const import_2.Decorator(selector: '[ng-toucheancel]', map: const {'ng-touchcancel': '&onTouchCancel'}),
    const import_2.Decorator(selector: '[ng-touchend]', map: const {'ng-touchend': '&onTouchEnd'}),
    const import_2.Decorator(selector: '[ng-touchenter]', map: const {'ng-touchenter': '&onTouchEnter'}),
    const import_2.Decorator(selector: '[ng-touchleave]', map: const {'ng-touchleave': '&onTouchLeave'}),
    const import_2.Decorator(selector: '[ng-touchmove]', map: const {'ng-touchmove': '&onTouchMove'}),
    const import_2.Decorator(selector: '[ng-touchstart]', map: const {'ng-touchstart': '&onTouchStart'}),
    const import_2.Decorator(selector: '[ng-transitionend]', map: const {'ng-transitionend': '&onTransitionEnd'}),
  ],
  import_4.NgCloak: const [
    const import_2.Decorator(selector: '[ng-cloak]'),
    const import_2.Decorator(selector: '.ng-cloak'),
  ],
  import_4.NgIf: const [
    const import_2.Decorator(children: import_2.Directive.TRANSCLUDE_CHILDREN, selector: '[ng-if]', map: const {'.': '=>condition'}),
  ],
  import_4.NgUnless: const [
    const import_2.Decorator(children: import_2.Directive.TRANSCLUDE_CHILDREN, selector: '[ng-unless]', map: const {'.': '=>condition'}),
  ],
  import_4.NgInclude: const [
    const import_2.Decorator(selector: '[ng-include]', map: const {'ng-include': '@url'}),
  ],
  import_4.NgModel: const [
    const import_2.Decorator(selector: '[ng-model]', map: const {'name': '@name', 'ng-model': '&model'}),
  ],
  import_4.InputCheckbox: const [
    const import_2.Decorator(selector: 'input[type=checkbox][ng-model]'),
  ],
  import_4.InputTextLike: const [
    const import_2.Decorator(selector: 'textarea[ng-model]'),
    const import_2.Decorator(selector: 'input[type=text][ng-model]'),
    const import_2.Decorator(selector: 'input[type=password][ng-model]'),
    const import_2.Decorator(selector: 'input[type=url][ng-model]'),
    const import_2.Decorator(selector: 'input[type=email][ng-model]'),
    const import_2.Decorator(selector: 'input[type=search][ng-model]'),
    const import_2.Decorator(selector: 'input[type=tel][ng-model]'),
    const import_2.Decorator(selector: 'input[type=color][ng-model]'),
  ],
  import_4.InputNumberLike: const [
    const import_2.Decorator(selector: 'input[type=number][ng-model]'),
    const import_2.Decorator(selector: 'input[type=range][ng-model]'),
  ],
  import_4.NgBindTypeForDateLike: const [
    const import_2.Decorator(selector: 'input[type=date][ng-model][ng-bind-type]', visibility: import_2.Visibility.LOCAL, map: const {'ng-bind-type': '@idlAttrKind'}),
    const import_2.Decorator(selector: 'input[type=time][ng-model][ng-bind-type]', visibility: import_2.Visibility.LOCAL, map: const {'ng-bind-type': '@idlAttrKind'}),
    const import_2.Decorator(selector: 'input[type=datetime][ng-model][ng-bind-type]', visibility: import_2.Visibility.LOCAL, map: const {'ng-bind-type': '@idlAttrKind'}),
    const import_2.Decorator(selector: 'input[type=datetime-local][ng-model][ng-bind-type]', visibility: import_2.Visibility.LOCAL, map: const {'ng-bind-type': '@idlAttrKind'}),
    const import_2.Decorator(selector: 'input[type=month][ng-model][ng-bind-type]', visibility: import_2.Visibility.LOCAL, map: const {'ng-bind-type': '@idlAttrKind'}),
    const import_2.Decorator(selector: 'input[type=week][ng-model][ng-bind-type]', visibility: import_2.Visibility.LOCAL, map: const {'ng-bind-type': '@idlAttrKind'}),
  ],
  import_4.InputDateLike: const [
    const import_2.Decorator(selector: 'input[type=date][ng-model]', module: import_4.InputDateLike.moduleFactory),
    const import_2.Decorator(selector: 'input[type=time][ng-model]', module: import_4.InputDateLike.moduleFactory),
    const import_2.Decorator(selector: 'input[type=datetime][ng-model]', module: import_4.InputDateLike.moduleFactory),
    const import_2.Decorator(selector: 'input[type=datetime-local][ng-model]', module: import_4.InputDateLike.moduleFactory),
    const import_2.Decorator(selector: 'input[type=month][ng-model]', module: import_4.InputDateLike.moduleFactory),
    const import_2.Decorator(selector: 'input[type=week][ng-model]', module: import_4.InputDateLike.moduleFactory),
  ],
  import_4.NgValue: const [
    const import_2.Decorator(selector: 'input[type=radio][ng-model][ng-value]', visibility: import_2.Visibility.LOCAL, map: const {'ng-value': '=>value'}),
    const import_2.Decorator(selector: 'option[ng-value]', visibility: import_2.Visibility.LOCAL, map: const {'ng-value': '=>value'}),
  ],
  import_4.NgTrueValue: const [
    const import_2.Decorator(selector: 'input[type=checkbox][ng-model][ng-true-value]', map: const {'ng-true-value': '=>value'}),
  ],
  import_4.NgFalseValue: const [
    const import_2.Decorator(selector: 'input[type=checkbox][ng-model][ng-false-value]', map: const {'ng-false-value': '=>value'}),
  ],
  import_4.InputRadio: const [
    const import_2.Decorator(selector: 'input[type=radio][ng-model]', module: import_4.NgValue.module),
  ],
  import_4.ContentEditable: const [
    const import_2.Decorator(selector: '[contenteditable][ng-model]'),
  ],
  import_4.NgPluralize: const [
    const import_2.Decorator(selector: 'ng-pluralize', map: const {'count': '=>count'}),
    const import_2.Decorator(selector: '[ng-pluralize]', map: const {'count': '=>count'}),
  ],
  import_4.NgRepeat: const [
    const import_2.Decorator(children: import_2.Directive.TRANSCLUDE_CHILDREN, selector: '[ng-repeat]', map: const {'.': '@expression'}),
  ],
  import_4.NgTemplate: const [
    const import_2.Decorator(selector: 'template[type=text/ng-template]', map: const {'id': '@templateUrl'}),
    const import_2.Decorator(selector: 'script[type=text/ng-template]', children: import_2.Directive.IGNORE_CHILDREN, map: const {'id': '@templateUrl'}),
  ],
  import_4.NgHide: const [
    const import_2.Decorator(selector: '[ng-hide]', map: const {'ng-hide': '=>hide'}),
  ],
  import_4.NgShow: const [
    const import_2.Decorator(selector: '[ng-show]', map: const {'ng-show': '=>show'}),
  ],
  import_4.NgBooleanAttribute: const [
    const import_2.Decorator(selector: '[ng-checked]', map: const {'ng-checked': '=>checked'}),
    const import_2.Decorator(selector: '[ng-disabled]', map: const {'ng-disabled': '=>disabled'}),
    const import_2.Decorator(selector: '[ng-multiple]', map: const {'ng-multiple': '=>multiple'}),
    const import_2.Decorator(selector: '[ng-open]', map: const {'ng-open': '=>open'}),
    const import_2.Decorator(selector: '[ng-readonly]', map: const {'ng-readonly': '=>readonly'}),
    const import_2.Decorator(selector: '[ng-required]', map: const {'ng-required': '=>required'}),
    const import_2.Decorator(selector: '[ng-selected]', map: const {'ng-selected': '=>selected'}),
  ],
  import_4.NgSource: const [
    const import_2.Decorator(selector: '[ng-href]', map: const {'ng-href': '@href'}),
    const import_2.Decorator(selector: '[ng-src]', map: const {'ng-src': '@src'}),
    const import_2.Decorator(selector: '[ng-srcset]', map: const {'ng-srcset': '@srcset'}),
  ],
  import_4.NgAttribute: const [
    const import_2.Decorator(selector: '[ng-attr-*]'),
  ],
  import_4.NgStyle: const [
    const import_2.Decorator(selector: '[ng-style]', map: const {'ng-style': '@styleExpression'}, exportExpressionAttrs: const ['ng-style',]),
  ],
  import_4.NgSwitch: const [
    const import_2.Decorator(selector: '[ng-switch]', map: const {'ng-switch': '=>value', 'change': '&onChange'}, visibility: import_2.Visibility.DIRECT_CHILD),
  ],
  import_4.NgSwitchWhen: const [
    const import_2.Decorator(selector: '[ng-switch-when]', children: import_2.Directive.TRANSCLUDE_CHILDREN, map: const {'.': '@value'}),
  ],
  import_4.NgSwitchDefault: const [
    const import_2.Decorator(children: import_2.Directive.TRANSCLUDE_CHILDREN, selector: '[ng-switch-default]'),
  ],
  import_4.NgNonBindable: const [
    const import_2.Decorator(selector: '[ng-non-bindable]', children: import_2.Directive.IGNORE_CHILDREN),
  ],
  import_4.InputSelect: const [
    const import_2.Decorator(selector: 'select[ng-model]', visibility: import_2.Visibility.CHILDREN),
  ],
  import_4.OptionValue: const [
    const import_2.Decorator(selector: 'option', module: import_4.NgValue.module),
  ],
  import_4.NgForm: const [
    const import_2.Decorator(selector: 'form', module: import_4.NgForm.module, map: const {'name': '&name'}),
    const import_2.Decorator(selector: 'fieldset', module: import_4.NgForm.module, map: const {'name': '&name'}),
    const import_2.Decorator(selector: '.ng-form', module: import_4.NgForm.module, map: const {'name': '&name'}),
    const import_2.Decorator(selector: '[ng-form]', module: import_4.NgForm.module, map: const {'ng-form': '&name', 'name': '&name'}),
  ],
  import_4.NgModelRequiredValidator: const [
    const import_2.Decorator(selector: '[ng-model][required]'),
    const import_2.Decorator(selector: '[ng-model][ng-required]', map: const {'ng-required': '=>required'}),
  ],
  import_4.NgModelUrlValidator: const [
    const import_2.Decorator(selector: 'input[type=url][ng-model]'),
  ],
  import_4.NgModelColorValidator: const [
    const import_2.Decorator(selector: 'input[type=color][ng-model]'),
  ],
  import_4.NgModelEmailValidator: const [
    const import_2.Decorator(selector: 'input[type=email][ng-model]'),
  ],
  import_4.NgModelNumberValidator: const [
    const import_2.Decorator(selector: 'input[type=number][ng-model]'),
    const import_2.Decorator(selector: 'input[type=range][ng-model]'),
  ],
  import_4.NgModelMaxNumberValidator: const [
    const import_2.Decorator(selector: 'input[type=number][ng-model][max]', map: const {'max': '@max'}),
    const import_2.Decorator(selector: 'input[type=range][ng-model][max]', map: const {'max': '@max'}),
    const import_2.Decorator(selector: 'input[type=number][ng-model][ng-max]', map: const {'ng-max': '=>max', 'max': '@max'}),
    const import_2.Decorator(selector: 'input[type=range][ng-model][ng-max]', map: const {'ng-max': '=>max', 'max': '@max'}),
  ],
  import_4.NgModelMinNumberValidator: const [
    const import_2.Decorator(selector: 'input[type=number][ng-model][min]', map: const {'min': '@min'}),
    const import_2.Decorator(selector: 'input[type=range][ng-model][min]', map: const {'min': '@min'}),
    const import_2.Decorator(selector: 'input[type=number][ng-model][ng-min]', map: const {'ng-min': '=>min', 'min': '@min'}),
    const import_2.Decorator(selector: 'input[type=range][ng-model][ng-min]', map: const {'ng-min': '=>min', 'min': '@min'}),
  ],
  import_4.NgModelPatternValidator: const [
    const import_2.Decorator(selector: '[ng-model][pattern]', map: const {'pattern': '@pattern'}),
    const import_2.Decorator(selector: '[ng-model][ng-pattern]', map: const {'ng-pattern': '=>pattern', 'pattern': '@pattern'}),
  ],
  import_4.NgModelMinLengthValidator: const [
    const import_2.Decorator(selector: '[ng-model][minlength]', map: const {'minlength': '@minlength'}),
    const import_2.Decorator(selector: '[ng-model][ng-minlength]', map: const {'ng-minlength': '=>minlength', 'minlength': '@minlength'}),
  ],
  import_4.NgModelMaxLengthValidator: const [
    const import_2.Decorator(selector: '[ng-model][maxlength]', map: const {'maxlength': '@maxlength'}),
    const import_2.Decorator(selector: '[ng-model][ng-maxlength]', map: const {'ng-maxlength': '=>maxlength', 'maxlength': '@maxlength'}),
  ],
  import_4.NgModelOptions: const [
    const import_2.Decorator(selector: 'input[ng-model-options]', map: const {'ng-model-options': '=>options'}),
  ],
  import_5.Parser: const [
    const import_1.Injectable(),
  ],
  import_5.RuntimeParserBackend: const [
    const import_1.Injectable(),
  ],
  import_6.FormatterMap: const [
    const import_1.Injectable(),
  ],
  import_7.ExceptionHandler: const [
    const import_1.Injectable(),
  ],
  import_7.Interpolate: const [
    const import_1.Injectable(),
  ],
  import_7.ScopeDigestTTL: const [
    const import_1.Injectable(),
  ],
  import_7.ScopeStats: const [
    const import_1.Injectable(),
  ],
  import_7.ScopeStatsEmitter: const [
    const import_1.Injectable(),
  ],
  import_7.ScopeStatsConfig: const [
    const import_1.Injectable(),
  ],
  import_7.RootScope: const [
    const import_1.Injectable(),
  ],
  import_8.PendingAsync: const [
    const import_1.Injectable(),
  ],
  import_9.Lexer: const [
    const import_1.Injectable(),
  ],
  import_10.ASTParser: const [
    const import_1.Injectable(),
  ],
  import_11.CacheRegister: const [
    const import_1.Injectable(),
  ],
  import_12.ResourceUrlResolver: const [
    const import_1.Injectable(),
  ],
  import_12.ResourceResolverConfig: const [
    const import_1.Injectable(),
  ],
  import_13.Currency: const [
    const import_2.Formatter(name: 'currency'),
  ],
  import_13.Date: const [
    const import_2.Formatter(name: 'date'),
  ],
  import_13.Filter: const [
    const import_2.Formatter(name: 'filter'),
  ],
  import_13.Json: const [
    const import_2.Formatter(name: 'json'),
  ],
  import_13.LimitTo: const [
    const import_2.Formatter(name: 'limitTo'),
  ],
  import_13.Lowercase: const [
    const import_2.Formatter(name: 'lowercase'),
  ],
  import_13.Arrayify: const [
    const import_2.Formatter(name: 'arrayify'),
  ],
  import_13.Number: const [
    const import_2.Formatter(name: 'number'),
  ],
  import_13.OrderBy: const [
    const import_2.Formatter(name: 'orderBy'),
  ],
  import_13.Uppercase: const [
    const import_2.Formatter(name: 'uppercase'),
  ],
  import_13.Stringify: const [
    const import_2.Formatter(name: 'stringify'),
  ],
  import_14.AnimationLoop: const [
    const import_1.Injectable(),
  ],
  import_14.AnimationFrame: const [
    const import_1.Injectable(),
  ],
  import_14.AnimationOptimizer: const [
    const import_1.Injectable(),
  ],
  import_14.CssAnimate: const [
    const import_1.Injectable(),
  ],
  import_14.CssAnimationMap: const [
    const import_1.Injectable(),
  ],
  import_14.NgAnimate: const [
    const import_2.Decorator(selector: '[ng-animate]', map: const {'ng-animate': '@option'}),
  ],
  import_14.NgAnimateChildren: const [
    const import_2.Decorator(selector: '[ng-animate-children]', map: const {'ng-animate-children': '@option'}),
  ],
  import_15.NgRoutingUsePushState: const [
    const import_1.Injectable(),
  ],
  import_15.NgRoutingHelper: const [
    const import_1.Injectable(),
  ],
  import_15.NgView: const [
    const import_2.Decorator(selector: 'ng-view', module: import_15.NgView.module, visibility: import_2.Visibility.CHILDREN),
  ],
  import_15.NgBindRoute: const [
    const import_2.Decorator(selector: '[ng-bind-route]', module: import_15.NgBindRoute.module, map: const {'ng-bind-route': '@routeName'}),
  ],
  import_16.JsCacheRegister: const [
    const import_1.Injectable(),
  ],
};
