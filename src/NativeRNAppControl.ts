import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
    Exit(): void;
    Restart(): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('RNAppControl');