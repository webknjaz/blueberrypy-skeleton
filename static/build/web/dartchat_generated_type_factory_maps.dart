library dartchat.web.dartchat.generated_type_factory_maps;

import 'package:di/di.dart';
import 'package:di/src/reflector_static.dart';

import 'dartchat.dart' as import_0;
import 'package:angular/core_dom/module_internal.dart' as import_1;
import 'package:angular/core/module_internal.dart' as import_2;
import 'package:perf_api/perf_api.dart' as import_3;
import 'package:di/src/injector.dart' as import_5;
import 'package:angular/core/formatter.dart' as import_6;
import 'package:angular/core/registry.dart' as import_7;
import 'package:angular/core/parser/parser.dart' as import_8;
import 'package:angular/change_detection/ast_parser.dart' as import_9;
import 'dart:html' as import_10;
import 'package:angular/core/pending_async.dart' as import_11;
import 'package:angular/change_detection/watch_group.dart' as import_12;
import 'package:angular/core_dom/type_to_uri_mapper.dart' as import_13;
import 'package:angular/core_dom/resource_url_resolver.dart' as import_14;
import 'package:angular/cache/module.dart' as import_15;
import 'package:angular/directive/module.dart' as import_16;
import 'package:angular/core_dom/directive_injector.dart' as import_17;
import 'package:angular/core/parser/lexer.dart' as import_18;
import 'package:angular/change_detection/change_detection.dart' as import_19;
import 'package:angular/formatter/module_internal.dart' as import_20;
import 'package:angular/animate/module.dart' as import_21;
import 'package:angular/routing/module.dart' as import_22;
import 'package:route_hierarchical/client.dart' as import_23;
import 'package:angular/application.dart' as import_24;
import 'package:angular/cache/js_cache_register.dart' as import_25;

final Key _KEY_API = new Key(import_0.API);
final Key _KEY_User = new Key(import_0.User);
final Key _KEY_Room = new Key(import_0.Room);
final Key _KEY_Http = new Key(import_1.Http);
final Key _KEY_HttpInterceptors = new Key(import_1.HttpInterceptors);
final Key _KEY_$roomsService = new Key(import_0.$roomsService);
final Key _KEY_$joinedRoomsService = new Key(import_0.$joinedRoomsService);
final Key _KEY_ExceptionHandler = new Key(import_2.ExceptionHandler);
final Key _KEY_BrowserCookies = new Key(import_1.BrowserCookies);
final Key _KEY_Profiler = new Key(import_3.Profiler);
final Key _KEY_Expando = new Key(Expando);
final Key _KEY_Injector = new Key(import_5.Injector);
final Key _KEY_FormatterMap = new Key(import_6.FormatterMap);
final Key _KEY_MetadataExtractor = new Key(import_7.MetadataExtractor);
final Key _KEY_DirectiveSelectorFactory = new Key(import_1.DirectiveSelectorFactory);
final Key _KEY_Parser = new Key(import_8.Parser);
final Key _KEY_CompilerConfig = new Key(import_1.CompilerConfig);
final Key _KEY_ASTParser = new Key(import_9.ASTParser);
final Key _KEY_ComponentFactory = new Key(import_1.ComponentFactory);
final Key _KEY_ShadowDomComponentFactory = new Key(import_1.ShadowDomComponentFactory);
final Key _KEY_TranscludingComponentFactory = new Key(import_1.TranscludingComponentFactory);
final Key _KEY_Node = new Key(import_10.Node);
final Key _KEY_ShadowRoot = new Key(import_10.ShadowRoot);
final Key _KEY_HttpDefaultHeaders = new Key(import_1.HttpDefaultHeaders);
final Key _KEY_LocationWrapper = new Key(import_1.LocationWrapper);
final Key _KEY_UrlRewriter = new Key(import_1.UrlRewriter);
final Key _KEY_HttpBackend = new Key(import_1.HttpBackend);
final Key _KEY_HttpDefaults = new Key(import_1.HttpDefaults);
final Key _KEY_RootScope = new Key(import_2.RootScope);
final Key _KEY_HttpConfig = new Key(import_1.HttpConfig);
final Key _KEY_VmTurnZone = new Key(import_2.VmTurnZone);
final Key _KEY_PendingAsync = new Key(import_11.PendingAsync);
final Key _KEY_AST = new Key(import_12.AST);
final Key _KEY_Scope = new Key(import_2.Scope);
final Key _KEY_NodeAttrs = new Key(import_1.NodeAttrs);
final Key _KEY_String = new Key(String);
final Key _KEY_Element = new Key(import_10.Element);
final Key _KEY_Animate = new Key(import_1.Animate);
final Key _KEY_DestinationLightDom = new Key(import_1.DestinationLightDom);
final Key _KEY_ElementBinderFactory = new Key(import_1.ElementBinderFactory);
final Key _KEY_Interpolate = new Key(import_2.Interpolate);
final Key _KEY_ViewFactoryCache = new Key(import_1.ViewFactoryCache);
final Key _KEY_PlatformJsBasedShim = new Key(import_1.PlatformJsBasedShim);
final Key _KEY_TypeToUriMapper = new Key(import_13.TypeToUriMapper);
final Key _KEY_ResourceUrlResolver = new Key(import_14.ResourceUrlResolver);
final Key _KEY_TemplateCache = new Key(import_1.TemplateCache);
final Key _KEY_ComponentCssRewriter = new Key(import_1.ComponentCssRewriter);
final Key _KEY_NodeTreeSanitizer = new Key(import_10.NodeTreeSanitizer);
final Key _KEY_CacheRegister = new Key(import_15.CacheRegister);
final Key _KEY_DefaultPlatformShim = new Key(import_1.DefaultPlatformShim);
final Key _KEY_SourceLightDom = new Key(import_1.SourceLightDom);
final Key _KEY_View = new Key(import_1.View);
final Key _KEY_Compiler = new Key(import_1.Compiler);
final Key _KEY_ElementProbe = new Key(import_1.ElementProbe);
final Key _KEY_NodeValidator = new Key(import_10.NodeValidator);
final Key _KEY_NgElement = new Key(import_1.NgElement);
final Key _KEY_ViewFactory = new Key(import_1.ViewFactory);
final Key _KEY_ViewPort = new Key(import_1.ViewPort);
final Key _KEY_DirectiveInjector = new Key(import_17.DirectiveInjector);
final Key _KEY_DirectiveMap = new Key(import_1.DirectiveMap);
final Key _KEY_NgModel = new Key(import_16.NgModel);
final Key _KEY_NgTrueValue = new Key(import_16.NgTrueValue);
final Key _KEY_NgFalseValue = new Key(import_16.NgFalseValue);
final Key _KEY_NgModelOptions = new Key(import_16.NgModelOptions);
final Key _KEY_NgBindTypeForDateLike = new Key(import_16.NgBindTypeForDateLike);
final Key _KEY_NgValue = new Key(import_16.NgValue);
final Key _KEY_BoundViewFactory = new Key(import_1.BoundViewFactory);
final Key _KEY_NgSwitch = new Key(import_16.NgSwitch);
final Key _KEY_InputSelect = new Key(import_16.InputSelect);
final Key _KEY_Lexer = new Key(import_18.Lexer);
final Key _KEY_ParserBackend = new Key(import_8.ParserBackend);
final Key _KEY_ClosureMap = new Key(import_8.ClosureMap);
final Key _KEY_ScopeStatsEmitter = new Key(import_2.ScopeStatsEmitter);
final Key _KEY_ScopeStatsConfig = new Key(import_2.ScopeStatsConfig);
final Key _KEY_Object = new Key(Object);
final Key _KEY_FieldGetterFactory = new Key(import_19.FieldGetterFactory);
final Key _KEY_ScopeDigestTTL = new Key(import_2.ScopeDigestTTL);
final Key _KEY_ScopeStats = new Key(import_2.ScopeStats);
final Key _KEY_ResourceResolverConfig = new Key(import_14.ResourceResolverConfig);
final Key _KEY_AnimationFrame = new Key(import_21.AnimationFrame);
final Key _KEY_Window = new Key(import_10.Window);
final Key _KEY_AnimationLoop = new Key(import_21.AnimationLoop);
final Key _KEY_CssAnimationMap = new Key(import_21.CssAnimationMap);
final Key _KEY_AnimationOptimizer = new Key(import_21.AnimationOptimizer);
final Key _KEY_RouteInitializer = new Key(import_22.RouteInitializer);
final Key _KEY_Router = new Key(import_23.Router);
final Key _KEY_Application = new Key(import_24.Application);
final Key _KEY_NgRoutingHelper = new Key(import_22.NgRoutingHelper);
final Map<Type, Function> typeFactories = <Type, Function>{
  import_0.$roomsService: (a1) => new import_0.$roomsService(a1),
  import_0.$joinedRoomsService: (a1, a2, a3) => new import_0.$joinedRoomsService(a1, a2, a3),
  import_0.User: () => new import_0.User(),
  import_0.Room: (a1) => new import_0.Room(a1),
  import_0.API: (a1, a2, a3) => new import_0.API(a1, a2, a3),
  import_0.LoginView: (a1, a2, a3) => new import_0.LoginView(a1, a2, a3),
  import_0.AppView: (a1) => new import_0.AppView(a1),
  import_0.Footer: (a1, a2, a3) => new import_0.Footer(a1, a2, a3),
  import_0.Sidebar: (a1, a2, a3, a4, a5, a6) => new import_0.Sidebar(a1, a2, a3, a4, a5, a6),
  import_0.Chat: (a1, a2, a3, a4) => new import_0.Chat(a1, a2, a3, a4),
  import_0.ChatMessage: () => new import_0.ChatMessage(),
  import_1.Animate: () => new import_1.Animate(),
  import_1.BrowserCookies: (a1) => new import_1.BrowserCookies(a1),
  import_1.Cookies: (a1) => new import_1.Cookies(a1),
  import_1.Compiler: (a1, a2) => new import_1.Compiler(a1, a2),
  import_1.CompilerConfig: () => new import_1.CompilerConfig(),
  import_1.DirectiveMap: (a1, a2, a3, a4) => new import_1.DirectiveMap(a1, a2, a3, a4),
  import_1.ElementBinderFactory: (a1, a2, a3, a4, a5, a6, a7, a8) => new import_1.ElementBinderFactory(a1, a2, a3, a4, a5, a6, a7, a8),
  import_1.EventHandler: (a1, a2, a3) => new import_1.EventHandler(a1, a2, a3),
  import_1.ShadowRootEventHandler: (a1, a2, a3) => new import_1.ShadowRootEventHandler(a1, a2, a3),
  import_1.DefaultShadowBoundary: () => new import_1.DefaultShadowBoundary(),
  import_1.ShadowRootBoundary: (a1) => new import_1.ShadowRootBoundary(a1),
  import_1.UrlRewriter: () => new import_1.UrlRewriter(),
  import_1.HttpBackend: () => new import_1.HttpBackend(),
  import_1.LocationWrapper: () => new import_1.LocationWrapper(),
  import_1.HttpInterceptors: () => new import_1.HttpInterceptors(),
  import_1.HttpDefaultHeaders: () => new import_1.HttpDefaultHeaders(),
  import_1.HttpDefaults: (a1) => new import_1.HttpDefaults(a1),
  import_1.Http: (a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) => new import_1.Http(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10),
  import_1.HttpConfig: () => new import_1.HttpConfig(),
  import_1.TextMustache: (a1, a2, a3) => new import_1.TextMustache(a1, a2, a3),
  import_1.AttrMustache: (a1, a2, a3, a4) => new import_1.AttrMustache(a1, a2, a3, a4),
  import_1.NgElement: (a1, a2, a3, a4) => new import_1.NgElement(a1, a2, a3, a4),
  import_1.DirectiveSelectorFactory: (a1, a2, a3, a4, a5) => new import_1.DirectiveSelectorFactory(a1, a2, a3, a4, a5),
  import_1.ShadowDomComponentFactory: (a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11) => new import_1.ShadowDomComponentFactory(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11),
  import_1.ComponentCssRewriter: () => new import_1.ComponentCssRewriter(),
  import_1.TranscludingComponentFactory: (a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11) => new import_1.TranscludingComponentFactory(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11),
  import_1.Content: (a1, a2, a3, a4) => new import_1.Content(a1, a2, a3, a4),
  import_1.NullTreeSanitizer: () => new import_1.NullTreeSanitizer(),
  import_1.ViewFactoryCache: (a1, a2, a3, a4, a5, a6) => new import_1.ViewFactoryCache(a1, a2, a3, a4, a5, a6),
  import_1.PlatformJsBasedShim: () => new import_1.PlatformJsBasedShim(),
  import_1.DefaultPlatformShim: () => new import_1.DefaultPlatformShim(),
  import_16.AHref: (a1, a2) => new import_16.AHref(a1, a2),
  import_16.NgBaseCss: () => new import_16.NgBaseCss(),
  import_16.NgBind: (a1, a2) => new import_16.NgBind(a1, a2),
  import_16.NgBindHtml: (a1, a2) => new import_16.NgBindHtml(a1, a2),
  import_16.NgBindTemplate: (a1) => new import_16.NgBindTemplate(a1),
  import_16.NgClass: (a1, a2, a3) => new import_16.NgClass(a1, a2, a3),
  import_16.NgClassOdd: (a1, a2, a3) => new import_16.NgClassOdd(a1, a2, a3),
  import_16.NgClassEven: (a1, a2, a3) => new import_16.NgClassEven(a1, a2, a3),
  import_16.NgEvent: (a1, a2) => new import_16.NgEvent(a1, a2),
  import_16.NgCloak: (a1, a2) => new import_16.NgCloak(a1, a2),
  import_16.NgIf: (a1, a2, a3) => new import_16.NgIf(a1, a2, a3),
  import_16.NgUnless: (a1, a2, a3) => new import_16.NgUnless(a1, a2, a3),
  import_16.NgInclude: (a1, a2, a3, a4, a5) => new import_16.NgInclude(a1, a2, a3, a4, a5),
  import_16.NgModel: (a1, a2, a3, a4, a5, a6) => new import_16.NgModel(a1, a2, a3, a4, a5, a6),
  import_16.InputCheckbox: (a1, a2, a3, a4, a5, a6) => new import_16.InputCheckbox(a1, a2, a3, a4, a5, a6),
  import_16.InputTextLike: (a1, a2, a3, a4) => new import_16.InputTextLike(a1, a2, a3, a4),
  import_16.InputNumberLike: (a1, a2, a3, a4) => new import_16.InputNumberLike(a1, a2, a3, a4),
  import_16.NgBindTypeForDateLike: (a1) => new import_16.NgBindTypeForDateLike(a1),
  import_16.InputDateLike: (a1, a2, a3, a4, a5) => new import_16.InputDateLike(a1, a2, a3, a4, a5),
  import_16.NgValue: (a1) => new import_16.NgValue(a1),
  import_16.NgTrueValue: (a1) => new import_16.NgTrueValue(a1),
  import_16.NgFalseValue: (a1) => new import_16.NgFalseValue(a1),
  import_16.InputRadio: (a1, a2, a3, a4, a5) => new import_16.InputRadio(a1, a2, a3, a4, a5),
  import_16.ContentEditable: (a1, a2, a3, a4) => new import_16.ContentEditable(a1, a2, a3, a4),
  import_16.NgPluralize: (a1, a2, a3, a4) => new import_16.NgPluralize(a1, a2, a3, a4),
  import_16.NgRepeat: (a1, a2, a3, a4, a5) => new import_16.NgRepeat(a1, a2, a3, a4, a5),
  import_16.NgTemplate: (a1, a2) => new import_16.NgTemplate(a1, a2),
  import_16.NgHide: (a1, a2) => new import_16.NgHide(a1, a2),
  import_16.NgShow: (a1, a2) => new import_16.NgShow(a1, a2),
  import_16.NgBooleanAttribute: (a1) => new import_16.NgBooleanAttribute(a1),
  import_16.NgSource: (a1) => new import_16.NgSource(a1),
  import_16.NgAttribute: (a1) => new import_16.NgAttribute(a1),
  import_16.NgStyle: (a1, a2) => new import_16.NgStyle(a1, a2),
  import_16.NgSwitch: (a1) => new import_16.NgSwitch(a1),
  import_16.NgSwitchWhen: (a1, a2, a3) => new import_16.NgSwitchWhen(a1, a2, a3),
  import_16.NgSwitchDefault: (a1, a2, a3) => new import_16.NgSwitchDefault(a1, a2, a3),
  import_16.NgNonBindable: () => new import_16.NgNonBindable(),
  import_16.InputSelect: (a1, a2, a3, a4) => new import_16.InputSelect(a1, a2, a3, a4),
  import_16.OptionValue: (a1, a2, a3) => new import_16.OptionValue(a1, a2, a3),
  import_16.NgForm: (a1, a2, a3, a4) => new import_16.NgForm(a1, a2, a3, a4),
  import_16.NgModelRequiredValidator: (a1) => new import_16.NgModelRequiredValidator(a1),
  import_16.NgModelUrlValidator: (a1) => new import_16.NgModelUrlValidator(a1),
  import_16.NgModelColorValidator: (a1) => new import_16.NgModelColorValidator(a1),
  import_16.NgModelEmailValidator: (a1) => new import_16.NgModelEmailValidator(a1),
  import_16.NgModelNumberValidator: (a1) => new import_16.NgModelNumberValidator(a1),
  import_16.NgModelMaxNumberValidator: (a1) => new import_16.NgModelMaxNumberValidator(a1),
  import_16.NgModelMinNumberValidator: (a1) => new import_16.NgModelMinNumberValidator(a1),
  import_16.NgModelPatternValidator: (a1) => new import_16.NgModelPatternValidator(a1),
  import_16.NgModelMinLengthValidator: (a1) => new import_16.NgModelMinLengthValidator(a1),
  import_16.NgModelMaxLengthValidator: (a1) => new import_16.NgModelMaxLengthValidator(a1),
  import_16.NgModelOptions: () => new import_16.NgModelOptions(),
  import_8.Parser: (a1, a2, a3) => new import_8.Parser(a1, a2, a3),
  import_8.RuntimeParserBackend: (a1) => new import_8.RuntimeParserBackend(a1),
  import_6.FormatterMap: (a1, a2) => new import_6.FormatterMap(a1, a2),
  import_2.ExceptionHandler: () => new import_2.ExceptionHandler(),
  import_2.Interpolate: (a1) => new import_2.Interpolate(a1),
  import_2.ScopeDigestTTL: () => new import_2.ScopeDigestTTL(),
  import_2.ScopeStats: (a1, a2) => new import_2.ScopeStats(a1, a2),
  import_2.ScopeStatsEmitter: () => new import_2.ScopeStatsEmitter(),
  import_2.ScopeStatsConfig: () => new import_2.ScopeStatsConfig(),
  import_2.RootScope: (a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11) => new import_2.RootScope(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11),
  import_11.PendingAsync: () => new import_11.PendingAsync(),
  import_18.Lexer: () => new import_18.Lexer(),
  import_9.ASTParser: (a1, a2) => new import_9.ASTParser(a1, a2),
  import_15.CacheRegister: () => new import_15.CacheRegister(),
  import_14.ResourceUrlResolver: (a1, a2) => new import_14.ResourceUrlResolver(a1, a2),
  import_14.ResourceResolverConfig: () => new import_14.ResourceResolverConfig(),
  import_20.Currency: () => new import_20.Currency(),
  import_20.Date: () => new import_20.Date(),
  import_20.Filter: (a1) => new import_20.Filter(a1),
  import_20.Json: () => new import_20.Json(),
  import_20.LimitTo: (a1) => new import_20.LimitTo(a1),
  import_20.Lowercase: () => new import_20.Lowercase(),
  import_20.Arrayify: () => new import_20.Arrayify(),
  import_20.Number: () => new import_20.Number(),
  import_20.OrderBy: (a1) => new import_20.OrderBy(a1),
  import_20.Uppercase: () => new import_20.Uppercase(),
  import_20.Stringify: () => new import_20.Stringify(),
  import_21.AnimationLoop: (a1, a2, a3) => new import_21.AnimationLoop(a1, a2, a3),
  import_21.AnimationFrame: (a1) => new import_21.AnimationFrame(a1),
  import_21.AnimationOptimizer: (a1) => new import_21.AnimationOptimizer(a1),
  import_21.CssAnimate: (a1, a2, a3) => new import_21.CssAnimate(a1, a2, a3),
  import_21.CssAnimationMap: () => new import_21.CssAnimationMap(),
  import_21.NgAnimate: (a1, a2) => new import_21.NgAnimate(a1, a2),
  import_21.NgAnimateChildren: (a1, a2) => new import_21.NgAnimateChildren(a1, a2),
  import_22.NgRoutingUsePushState: () => new import_22.NgRoutingUsePushState(),
  import_22.NgRoutingHelper: (a1, a2, a3, a4) => new import_22.NgRoutingHelper(a1, a2, a3, a4),
  import_22.NgView: (a1, a2, a3, a4, a5, a6) => new import_22.NgView(a1, a2, a3, a4, a5, a6),
  import_22.NgBindRoute: (a1, a2, a3) => new import_22.NgBindRoute(a1, a2, a3),
  import_25.JsCacheRegister: (a1) => new import_25.JsCacheRegister(a1),
  import_3.Profiler: () => new import_3.Profiler(),
};
final Map<Type, List<Key>> parameterKeys = {
  import_0.$roomsService: [_KEY_API],
  import_0.$joinedRoomsService: [_KEY_API, _KEY_User, _KEY_Room],
  import_0.User: const[],
  import_0.Room: [_KEY_API],
  import_0.API: [_KEY_Http, _KEY_User, _KEY_HttpInterceptors],
  import_0.LoginView: [_KEY_User, _KEY_API, _KEY_Room],
  import_0.AppView: [_KEY_User],
  import_0.Footer: [_KEY_User, _KEY_API, _KEY_Room],
  import_0.Sidebar: [_KEY_User, _KEY_Http, _KEY_API, _KEY_Room, _KEY_$roomsService, _KEY_$joinedRoomsService],
  import_0.Chat: [_KEY_Room, _KEY_API, _KEY_$roomsService, _KEY_$joinedRoomsService],
  import_0.ChatMessage: const[],
  import_1.Animate: const[],
  import_1.BrowserCookies: [_KEY_ExceptionHandler],
  import_1.Cookies: [_KEY_BrowserCookies],
  import_1.Compiler: [_KEY_Profiler, _KEY_Expando],
  import_1.CompilerConfig: const[],
  import_1.DirectiveMap: [_KEY_Injector, _KEY_FormatterMap, _KEY_MetadataExtractor, _KEY_DirectiveSelectorFactory],
  import_1.ElementBinderFactory: [_KEY_Parser, _KEY_Profiler, _KEY_CompilerConfig, _KEY_Expando, _KEY_ASTParser, _KEY_ComponentFactory, _KEY_ShadowDomComponentFactory, _KEY_TranscludingComponentFactory],
  import_1.EventHandler: [_KEY_Node, _KEY_Expando, _KEY_ExceptionHandler],
  import_1.ShadowRootEventHandler: [_KEY_ShadowRoot, _KEY_Expando, _KEY_ExceptionHandler],
  import_1.DefaultShadowBoundary: const[],
  import_1.ShadowRootBoundary: [_KEY_ShadowRoot],
  import_1.UrlRewriter: const[],
  import_1.HttpBackend: const[],
  import_1.LocationWrapper: const[],
  import_1.HttpInterceptors: const[],
  import_1.HttpDefaultHeaders: const[],
  import_1.HttpDefaults: [_KEY_HttpDefaultHeaders],
  import_1.Http: [_KEY_BrowserCookies, _KEY_LocationWrapper, _KEY_UrlRewriter, _KEY_HttpBackend, _KEY_HttpDefaults, _KEY_HttpInterceptors, _KEY_RootScope, _KEY_HttpConfig, _KEY_VmTurnZone, _KEY_PendingAsync],
  import_1.HttpConfig: const[],
  import_1.TextMustache: [_KEY_Node, _KEY_AST, _KEY_Scope],
  import_1.AttrMustache: [_KEY_NodeAttrs, _KEY_String, _KEY_AST, _KEY_Scope],
  import_1.NgElement: [_KEY_Element, _KEY_RootScope, _KEY_Animate, _KEY_DestinationLightDom],
  import_1.DirectiveSelectorFactory: [_KEY_ElementBinderFactory, _KEY_Interpolate, _KEY_ASTParser, _KEY_FormatterMap, _KEY_Injector],
  import_1.ShadowDomComponentFactory: [_KEY_ViewFactoryCache, _KEY_PlatformJsBasedShim, _KEY_Expando, _KEY_CompilerConfig, _KEY_TypeToUriMapper, _KEY_ResourceUrlResolver, _KEY_Http, _KEY_TemplateCache, _KEY_ComponentCssRewriter, _KEY_NodeTreeSanitizer, _KEY_CacheRegister],
  import_1.ComponentCssRewriter: const[],
  import_1.TranscludingComponentFactory: [_KEY_Expando, _KEY_ViewFactoryCache, _KEY_CompilerConfig, _KEY_DefaultPlatformShim, _KEY_TypeToUriMapper, _KEY_ResourceUrlResolver, _KEY_Http, _KEY_TemplateCache, _KEY_ComponentCssRewriter, _KEY_NodeTreeSanitizer, _KEY_CacheRegister],
  import_1.Content: [_KEY_Element, _KEY_SourceLightDom, _KEY_DestinationLightDom, _KEY_View],
  import_1.NullTreeSanitizer: const[],
  import_1.ViewFactoryCache: [_KEY_Http, _KEY_TemplateCache, _KEY_Compiler, _KEY_NodeTreeSanitizer, _KEY_ResourceUrlResolver, _KEY_CacheRegister],
  import_1.PlatformJsBasedShim: const[],
  import_1.DefaultPlatformShim: const[],
  import_16.AHref: [_KEY_Element, _KEY_VmTurnZone],
  import_16.NgBaseCss: const[],
  import_16.NgBind: [_KEY_Element, _KEY_ElementProbe],
  import_16.NgBindHtml: [_KEY_Element, _KEY_NodeValidator],
  import_16.NgBindTemplate: [_KEY_Element],
  import_16.NgClass: [_KEY_NgElement, _KEY_Scope, _KEY_NodeAttrs],
  import_16.NgClassOdd: [_KEY_NgElement, _KEY_Scope, _KEY_NodeAttrs],
  import_16.NgClassEven: [_KEY_NgElement, _KEY_Scope, _KEY_NodeAttrs],
  import_16.NgEvent: [_KEY_Element, _KEY_Scope],
  import_16.NgCloak: [_KEY_Element, _KEY_Animate],
  import_16.NgIf: [_KEY_ViewFactory, _KEY_ViewPort, _KEY_Scope],
  import_16.NgUnless: [_KEY_ViewFactory, _KEY_ViewPort, _KEY_Scope],
  import_16.NgInclude: [_KEY_Element, _KEY_Scope, _KEY_ViewFactoryCache, _KEY_DirectiveInjector, _KEY_DirectiveMap],
  import_16.NgModel: [_KEY_Scope, _KEY_NgElement, _KEY_DirectiveInjector, _KEY_NodeAttrs, _KEY_Animate, _KEY_ElementProbe],
  import_16.InputCheckbox: [_KEY_Element, _KEY_NgModel, _KEY_Scope, _KEY_NgTrueValue, _KEY_NgFalseValue, _KEY_NgModelOptions],
  import_16.InputTextLike: [_KEY_Element, _KEY_NgModel, _KEY_Scope, _KEY_NgModelOptions],
  import_16.InputNumberLike: [_KEY_Element, _KEY_NgModel, _KEY_Scope, _KEY_NgModelOptions],
  import_16.NgBindTypeForDateLike: [_KEY_Element],
  import_16.InputDateLike: [_KEY_Element, _KEY_NgModel, _KEY_Scope, _KEY_NgBindTypeForDateLike, _KEY_NgModelOptions],
  import_16.NgValue: [_KEY_Element],
  import_16.NgTrueValue: [_KEY_Element],
  import_16.NgFalseValue: [_KEY_Element],
  import_16.InputRadio: [_KEY_Element, _KEY_NgModel, _KEY_Scope, _KEY_NgValue, _KEY_NodeAttrs],
  import_16.ContentEditable: [_KEY_Element, _KEY_NgModel, _KEY_Scope, _KEY_NgModelOptions],
  import_16.NgPluralize: [_KEY_Scope, _KEY_Element, _KEY_Interpolate, _KEY_FormatterMap],
  import_16.NgRepeat: [_KEY_ViewPort, _KEY_BoundViewFactory, _KEY_Scope, _KEY_Parser, _KEY_FormatterMap],
  import_16.NgTemplate: [_KEY_Element, _KEY_TemplateCache],
  import_16.NgHide: [_KEY_Element, _KEY_Animate],
  import_16.NgShow: [_KEY_Element, _KEY_Animate],
  import_16.NgBooleanAttribute: [_KEY_NgElement],
  import_16.NgSource: [_KEY_NgElement],
  import_16.NgAttribute: [_KEY_NodeAttrs],
  import_16.NgStyle: [_KEY_Element, _KEY_Scope],
  import_16.NgSwitch: [_KEY_Scope],
  import_16.NgSwitchWhen: [_KEY_NgSwitch, _KEY_ViewPort, _KEY_BoundViewFactory],
  import_16.NgSwitchDefault: [_KEY_NgSwitch, _KEY_ViewPort, _KEY_BoundViewFactory],
  import_16.NgNonBindable: const[],
  import_16.InputSelect: [_KEY_Element, _KEY_NodeAttrs, _KEY_NgModel, _KEY_Scope],
  import_16.OptionValue: [_KEY_Element, _KEY_InputSelect, _KEY_NgValue],
  import_16.NgForm: [_KEY_Scope, _KEY_NgElement, _KEY_DirectiveInjector, _KEY_Animate],
  import_16.NgModelRequiredValidator: [_KEY_NgModel],
  import_16.NgModelUrlValidator: [_KEY_NgModel],
  import_16.NgModelColorValidator: [_KEY_NgModel],
  import_16.NgModelEmailValidator: [_KEY_NgModel],
  import_16.NgModelNumberValidator: [_KEY_NgModel],
  import_16.NgModelMaxNumberValidator: [_KEY_NgModel],
  import_16.NgModelMinNumberValidator: [_KEY_NgModel],
  import_16.NgModelPatternValidator: [_KEY_NgModel],
  import_16.NgModelMinLengthValidator: [_KEY_NgModel],
  import_16.NgModelMaxLengthValidator: [_KEY_NgModel],
  import_16.NgModelOptions: const[],
  import_8.Parser: [_KEY_Lexer, _KEY_ParserBackend, _KEY_CacheRegister],
  import_8.RuntimeParserBackend: [_KEY_ClosureMap],
  import_6.FormatterMap: [_KEY_Injector, _KEY_MetadataExtractor],
  import_2.ExceptionHandler: const[],
  import_2.Interpolate: [_KEY_CacheRegister],
  import_2.ScopeDigestTTL: const[],
  import_2.ScopeStats: [_KEY_ScopeStatsEmitter, _KEY_ScopeStatsConfig],
  import_2.ScopeStatsEmitter: const[],
  import_2.ScopeStatsConfig: const[],
  import_2.RootScope: [_KEY_Object, _KEY_Parser, _KEY_ASTParser, _KEY_FieldGetterFactory, _KEY_FormatterMap, _KEY_ExceptionHandler, _KEY_ScopeDigestTTL, _KEY_VmTurnZone, _KEY_ScopeStats, _KEY_CacheRegister, _KEY_PendingAsync],
  import_11.PendingAsync: const[],
  import_18.Lexer: const[],
  import_9.ASTParser: [_KEY_Parser, _KEY_ClosureMap],
  import_15.CacheRegister: const[],
  import_14.ResourceUrlResolver: [_KEY_TypeToUriMapper, _KEY_ResourceResolverConfig],
  import_14.ResourceResolverConfig: const[],
  import_20.Currency: const[],
  import_20.Date: const[],
  import_20.Filter: [_KEY_Parser],
  import_20.Json: const[],
  import_20.LimitTo: [_KEY_Injector],
  import_20.Lowercase: const[],
  import_20.Arrayify: const[],
  import_20.Number: const[],
  import_20.OrderBy: [_KEY_Parser],
  import_20.Uppercase: const[],
  import_20.Stringify: const[],
  import_21.AnimationLoop: [_KEY_AnimationFrame, _KEY_Profiler, _KEY_VmTurnZone],
  import_21.AnimationFrame: [_KEY_Window],
  import_21.AnimationOptimizer: [_KEY_Expando],
  import_21.CssAnimate: [_KEY_AnimationLoop, _KEY_CssAnimationMap, _KEY_AnimationOptimizer],
  import_21.CssAnimationMap: const[],
  import_21.NgAnimate: [_KEY_Element, _KEY_AnimationOptimizer],
  import_21.NgAnimateChildren: [_KEY_Element, _KEY_AnimationOptimizer],
  import_22.NgRoutingUsePushState: const[],
  import_22.NgRoutingHelper: [_KEY_RouteInitializer, _KEY_Injector, _KEY_Router, _KEY_Application],
  import_22.NgView: [_KEY_Element, _KEY_ViewFactoryCache, _KEY_DirectiveInjector, _KEY_Injector, _KEY_Router, _KEY_Scope],
  import_22.NgBindRoute: [_KEY_Router, _KEY_DirectiveInjector, _KEY_NgRoutingHelper],
  import_25.JsCacheRegister: [_KEY_CacheRegister],
  import_3.Profiler: const[],
};
setStaticReflectorAsDefault() => Module.DEFAULT_REFLECTOR = new GeneratedTypeFactories(typeFactories, parameterKeys);
