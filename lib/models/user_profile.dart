enum AvatarChoice {
  both('Alien + Caveira'),
  alien('Apenas Alien'),
  skull('Apenas Caveira'),
  person('Ícone Padrão');

  const AvatarChoice(this.label);
  final String label;
}

class UserProfile {
  final String name;
  final String email;
  final String role;
  final String department;
  final String phone;
  final String bio;
  final AvatarChoice avatarChoice;

  const UserProfile({
    required this.name,
    required this.email,
    required this.role,
    required this.department,
    required this.phone,
    this.bio = '',
    this.avatarChoice = AvatarChoice.both,
  });

  UserProfile copyWith({
    String? name,
    String? email,
    String? role,
    String? department,
    String? phone,
    String? bio,
    AvatarChoice? avatarChoice,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      department: department ?? this.department,
      phone: phone ?? this.phone,
      bio: bio ?? this.bio,
      avatarChoice: avatarChoice ?? this.avatarChoice,
    );
  }
}

const defaultUserProfile = UserProfile(
  name: 'Igor-Veiga (Pedro)',
  email: 'igor.veiga@folksrh.com.br',
  role: 'Gestor de Recursos Humanos',
  department: 'Folks RH - Recrutamento & Seleção',
  phone: '(11) 98765-4321',
  bio: 'Responsável pelo gerenciamento de processos seletivos, triagem de talentos e acompanhamento de equipes na Folks RH.',
  avatarChoice: AvatarChoice.both,
);
