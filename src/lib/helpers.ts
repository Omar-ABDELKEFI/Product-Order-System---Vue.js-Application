
interface Permission {
  id: number;
  name: string;
}

export function hasPermission(permissions: Permission[], role: string): boolean {
    
  return permissions.some(permission => permission.name === role);
}